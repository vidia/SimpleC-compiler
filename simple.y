/*
 * CS250
 *
 * simple.l: simple parser for the simple "C" language
 *
 */

%token	<string_val> WORD

%token 	NOTOKEN LPARENT RPARENT LBRACE RBRACE LCURLY RCURLY COMA SEMICOLON EQUAL STRING_CONST LONG LONGSTAR VOID CHARSTAR CHARSTARSTAR INTEGER_CONST AMPERSAND OROR ANDAND EQUALEQUAL NOTEQUAL LESS GREAT LESSEQUAL GREATEQUAL PLUS MINUS TIMES DIVIDE PERCENT IF ELSE WHILE DO FOR CONTINUE BREAK RETURN

%union	{
		char   *string_val;
		int nargs;
		int my_nlabel;
	}

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int line_number;
const char * input_file;
char * asm_file;
FILE * fasm;

#define MAX_ARGS 5
int nargs;
char * args_table[MAX_ARGS];

#define MAX_GLOBALS 100
int nglobals = 0;
char * global_vars_table[MAX_GLOBALS];

int global_vars_type[MAX_GLOBALS];

#define MAX_LOCALS 16
int nlocals = 0;
char * local_vars_table[MAX_LOCALS];
int local_vars_type[MAX_LOCALS];


#define MAX_STRINGS 100
int nstrings = 0;
char * string_table[MAX_STRINGS];

char *regStk[]={ "rbx", "r10", "r13", "r14", "r15"};
char nregStk = sizeof(regStk)/sizeof(char*);

char *regArgs[]={ "rdi", "rsi", "rdx", "rcx", "r8", "r9"};
char nregArgs = sizeof(regArgs)/sizeof(char*);

int current_type;

int top = 0;

int nargs =0;
 
int nlabel = 0;

double jumpLabelCounter = 0; 

double ifLabelCounter = 0; 


void addGlobalVar(char *id, int type) {
  global_vars_table[nglobals]=id;
  global_vars_type[nglobals]=type;
  nglobals++;
}

int lookupGlobalVar(char *id) {
	 int i;
	 for (i=0; i<nglobals;i++) {
		 if (!strcmp(global_vars_table[i], id)) {
			 return i;
		 }
	 }
	 return -1;
}

void addLocalVar(char *id, int type) {
  local_vars_table[nlocals]=id;
  local_vars_type[nlocals]=type;
  nlocals++;
}

int lookupLocalVar(char *id) {
	 int i;
	 for (i=0; i<nlocals;i++) {
		 if (!strcmp(local_vars_table[i], id)) {
			 return i;
		 }
	 }
	 return -1;
}

%}

%%

goal:	program
	;

program :
        function_or_var_list;

function_or_var_list:
        function_or_var_list function
        | function_or_var_list global_var
        | /*empty */
	;

function:
         var_type WORD
         {
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", $2);
		 fprintf(fasm, "%s:\n", $2);

		 fprintf(fasm, "# Save registers\n");
		 fprintf(fasm, "\tpushq %%rbx\n");
		 fprintf(fasm, "\tpushq %%r10\n");
		 fprintf(fasm, "\tpushq %%r13\n");
		 fprintf(fasm, "\tpushq %%r14\n");
		 fprintf(fasm, "\tpushq %%r15\n");
		 fprintf(fasm, "\tsubq $%d,%%rsp\n", 8*MAX_LOCALS); // Reserve space for args and locals
		 nlocals = 0;

	 }
	 LPARENT arguments RPARENT 
         {
		 int i;
		 fprintf(fasm, "\t#Save arguments\n");
		 for (i=0; i<nlocals;i++) {
		     fprintf(fasm, "\tmovq %%%s,%d(%%rsp)\n",
			     regArgs[i], 8*(MAX_LOCALS-i) );
		 }
         }
compound_statement
         {
		 fprintf(fasm, "\taddq $%d,%%rsp\n", 8*MAX_LOCALS); // Restore space in stack for local vars
		 fprintf(fasm, "# Restore registers\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", $2);
         }
	;

arg_list:
         arg
         | arg_list COMA arg
	 ;

arguments:
         arg_list
	 | /*empty*/
	 ;

arg: var_type WORD {
        char * id = $<string_val>2;
        addLocalVar(id, 0/*current_type*/);
}
;

global_var: 
        var_type global_var_list SEMICOLON;

global_var_list: WORD {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", $<string_val>1); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
        }
| global_var_list COMA WORD {
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", $<string_val>3); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
}
        ;

var_type: CHARSTAR | CHARSTARSTAR | LONG | LONGSTAR | VOID;

assignment:
         WORD EQUAL expression {
                 char * id = $<string_val>1;
                 int i = lookupLocalVar(id);
                 
                 if (i>=0) {
                         fprintf(fasm, "\t#Assign to Local var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n", regStk[top-1], 8*(MAX_LOCALS-i) );
                 }
                 else {
                         fprintf(fasm, "\t#Assign to Global var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %s\n", regStk[top-1], id);
                 }
                 top--;
	 }
	 | WORD LBRACE expression RBRACE {
		 // Lookup local var
		 int i;
 	     char * id = $<string_val>1;
		 i = lookupLocalVar(id);
		 
		 //multiply the top of the stack by 8
		 fprintf(fasm, "\t\n#Calculating array offset...\n");
		 fprintf(fasm, "\t#Multiply the index by 8\n");
		 fprintf(fasm, "\tmovq $8, %%rbp\n");
		 fprintf(fasm, "\timulq %%rbp, %%%s\n", regStk[top-1]);
		 
		 if (i>=0) {
			 fprintf(fasm, "\t#Push Local array var %s\n", id);
			 fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*(MAX_LOCALS-i), regStk[top]);
			 top++;
		 }
		 else {
			 fprintf(fasm, "\t#Push Global array var %s\n", id);
			 fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 top++;
		 }
		 
		 fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		 top--;
	 }
	 EQUAL expression {
		 fprintf(fasm, "\tmovq %%%s, (%%%s)\n", regStk[top-1], regStk[top-2]);
		 top-=2;
	 }
	 ;

call :
         WORD LPARENT  call_arguments RPARENT {
		 char * funcName = $<string_val>1;
		 int nargs = $<nargs>3;
		 int i;
		 fprintf(fasm,"     # func=%s nargs=%d\n", funcName, nargs);
     		 fprintf(fasm,"     # Move values from reg stack to reg args\n");
		 for (i=nargs-1; i>=0; i--) {
			top--;
			fprintf(fasm, "\tmovq %%%s, %%%s\n",
			  regStk[top], regArgs[i]);
		 }
		 ////if (!strcmp(funcName, "printf")) {
			 // printf has a variable number of arguments
			 // and it need the following
			 fprintf(fasm, "\tmovl    $0, %%eax\n");
		 ////}
		 fprintf(fasm, "\tcall %s\n", funcName);
		 fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top]);
		 top++;
         }
      ;

call_arg_list:
         expression {
		$<nargs>$=1;
	 }
         | call_arg_list COMA expression {
		$<nargs>$++;
	 }

	 ;

call_arguments:
         call_arg_list { $<nargs>$=$<nargs>1; }
	 | /*empty*/ { $<nargs>$=0;}
	 ;

expression :
         logical_or_expr
	 ;

logical_or_expr:
         logical_and_expr
	 | logical_or_expr OROR logical_and_expr {
		fprintf(fasm, "\n\t#OROR\n");
		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
	 }
	 ;

logical_and_expr:
         equality_expr
	 | logical_and_expr ANDAND equality_expr {
		fprintf(fasm, "\n\t#ANDAND\n");
		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
	 }
	 ;

equality_expr:
         relational_expr
	 | equality_expr EQUALEQUAL relational_expr {
	 
		fprintf(fasm, "\n\t# ==\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjne nequal_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tnequal_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
		
		/* Example output...
		cmp ----
		jne n_equal_1
		-----do equal case---
		jmp end_1
		n_equal_1:
		----do not equal case-----
		end:
		----continue...----- */
	 }
	 | equality_expr NOTEQUAL relational_expr {
	 
		fprintf(fasm, "\n\t# !=\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjne nequal_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tnequal_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
		
		/* Example output...
		cmp ----
		jne n_equal_1
		-----do equal case---
		jmp end_1
		n_equal_1:
		----do not equal case-----
		end:
		----continue...----- */
	 }
	 ;

relational_expr:
         additive_expr
	 | relational_expr LESS additive_expr {
		fprintf(fasm, "\n\t# <\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjl less_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tless_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
	}
	 | relational_expr GREAT additive_expr {
		fprintf(fasm, "\n\t# >\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjg great_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tgreat_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
	}
	 | relational_expr LESSEQUAL additive_expr {
		fprintf(fasm, "\n\t# <=\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjle lessequal_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tlessequal_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
	}
	 | relational_expr GREATEQUAL additive_expr {
		fprintf(fasm, "\n\t# >=\n");
		fprintf(fasm, "\tcmp %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tjge greatequal_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x0, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tjmp end_%f\n", jumpLabelCounter);
		fprintf(fasm, "\tgreatequal_%f:\n", jumpLabelCounter);
		fprintf(fasm, "\tmovq $0x1, %%%s\n", regStk[top-2]);
		fprintf(fasm, "\tend_%f:\n", jumpLabelCounter);
		
		jumpLabelCounter++;
		top--;
	}
	 ;

additive_expr:
          multiplicative_expr
	  | additive_expr PLUS multiplicative_expr {
		fprintf(fasm,"\n\t# +\n");
		if (top<nregStk) {
			fprintf(fasm, "\taddq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
	  | additive_expr MINUS multiplicative_expr {
		fprintf(fasm,"\n\t# -\n");
		if (top<nregStk) {
			fprintf(fasm, "\tsubq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
	  ;

multiplicative_expr:
          primary_expr
	  | multiplicative_expr TIMES primary_expr {
		fprintf(fasm,"\n\t# *\n");
		if (top<nregStk) {
			fprintf(fasm, "\timulq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
          }
	  | multiplicative_expr DIVIDE primary_expr {
		fprintf(fasm,"\n\t# /\n");
		if (top<nregStk) {
			fprintf(fasm, "\tmovq $0, %rdx\n");
			fprintf(fasm, "\tmovq %%%s, %rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tmovq %rax, %%%s\n", regStk[top-2]);
			top--;
		}
      }
	  | multiplicative_expr PERCENT primary_expr {
		fprintf(fasm,"\n\t# /\n");
		if (top<nregStk) {
			fprintf(fasm, "\tmovq $0, %rdx\n");
			fprintf(fasm, "\tmovq %%%s, %rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tmovq %rdx, %%%s\n", regStk[top-2]);
			top--;
		}
      }
	  ;

primary_expr:
	  STRING_CONST {
		  // Add string to string table.
		  // String table will be produced later
		  string_table[nstrings]=$<string_val>1;
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n",
			  $<string_val>1, top);
		  if (top<nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", 
				nstrings, regStk[top]);
			//fprintf(fasm, "\tmovq $%s,%%%s\n", 
				//$<string_val>1, regStk[top]);
			top++;
		  }
		  nstrings++;
	  }
          | call
	  | WORD {
  		// Lookup local var
		 int i;
 	         char * id = $<string_val>1;
		 i = lookupLocalVar(id);
		 if (i>=0) {
			 fprintf(fasm, "\t#Push Local var %s\n", id);
			 fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*(MAX_LOCALS-i), 
regStk[top] );
			 top++;
		 }
		 else {
			 // Global var
			 fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 top++;
		 }
	  }
	  | WORD LBRACE expression RBRACE {
  		 // Lookup local var
		 int i;
 	     char * id = $<string_val>1;
		 i = lookupLocalVar(id);
		 
		 //multiply the top of the stack by 8
		 fprintf(fasm, "\t\n#Calculating array offset...\n");
		 fprintf(fasm, "\t#Multiply the index by 8\n");
		 fprintf(fasm, "\tmovq $8, %%rbp\n");
		 fprintf(fasm, "\timulq %%rbp, %%%s\n", regStk[top-1]);
		 
		 if (i>=0) {
			 fprintf(fasm, "\t#Push Local array var %s\n", id);
			 fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*(MAX_LOCALS-i), regStk[top]);
			 top++;
		 }
		 else {
			 fprintf(fasm, "\t#Push Global array var %s\n", id);
			 fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 top++;
		 }
		 
		 fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		 top--;
		 
		 //dereference
		 fprintf(fasm, "\tmovq (%%%s), %%%s\n", regStk[top-1], regStk[top-1]);
	  }
	  | AMPERSAND WORD
	  | INTEGER_CONST {
		  fprintf(fasm, "\n\t# push %s\n", $<string_val>1);
		  if (top<nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", 
				$<string_val>1, regStk[top]);
			top++;
		  }
	  }
	  | LPARENT expression RPARENT
	  ;

compound_statement:
	 LCURLY statement_list RCURLY
	 ;

statement_list:
         statement_list statement
	 | /*empty*/
	 ;

local_var:
        var_type local_var_list SEMICOLON;

local_var_list: WORD {
		addLocalVar($<string_val>1, current_type);
     }
     | local_var_list COMA WORD {
		addLocalVar($<string_val>3, current_type);
	 }
        ;

statement:
         assignment SEMICOLON
	 | call SEMICOLON {
		top = 0;
	 }
	 | local_var
	 | compound_statement
	 | IF LPARENT expression RPARENT {
			ifLabelCounter++;
			fprintf(fasm, "\n\t# Begin IF statement\n");
			fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tje ifEnd_%f\n", ifLabelCounter);
			//fall through to statements...
			
			/*
			if (something is true)
			lbl: ifStart_#: /answer is true
			{
				statements...
				jmp: ifAbsEnd_#:
			}
			lbl: ifEnd_#:
			//else 
			{
				statements...
			}
			lbl: ifAbsEnd_#:
			*/
		}	 
		statement {
			fprintf(fasm, "\tjmp ifAbsEnd_%f\n", ifLabelCounter);
			fprintf(fasm, "\tifEnd_%f:\n", ifLabelCounter);
		}
		else_optional {
			fprintf(fasm, "\tifAbsEnd_%f:\n", ifLabelCounter);
		 }
	 | WHILE LPARENT {
		// act 1
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n\t# Begin WHILE loop\n");
		fprintf(fasm, "loop_start_%d:\n", $<my_nlabel>1);
		fprintf(fasm, "loop_continue_%d:\n", $<my_nlabel>1);
	 }
        expression RPARENT {
		// act2
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "\tje loop_end_%d\n", $<my_nlabel>1);
		top--;
         }
         statement {
		// act3
		fprintf(fasm, "\tjmp loop_start_%d\n", $<my_nlabel>1);
		fprintf(fasm, "loop_end_%d:\n", $<my_nlabel>1);
	 }
	 | DO {
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n\t# Begin DO/WHILE loop\n");
		fprintf(fasm, "loop_start_%d:\n", $<my_nlabel>1);
		fprintf(fasm, "loop_continue_%d:\n", $<my_nlabel>1);
	 }
	 statement WHILE LPARENT expression {
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "\tjne loop_start_%d\n", $<my_nlabel>1);
		top--;
	 }
	 RPARENT SEMICOLON {
		fprintf(fasm, "loop_end_%d:\n", $<my_nlabel>1);
	 }
	 | FOR LPARENT assignment SEMICOLON {
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n\t# Begin FOR loop\n");
		fprintf(fasm, "loop_start_%d:\n", $<my_nlabel>1);
	 }
	 expression {
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "\tje loop_end_%d\n", $<my_nlabel>1);
		fprintf(fasm, "\tjne loop_body_start_%d\n", $<my_nlabel>1);
		top--;
	 } 
	 SEMICOLON {
		fprintf(fasm, "\tloop_assignment_%d:\n", $<my_nlabel>1);
		fprintf(fasm, "loop_continue_%d:\n", $<my_nlabel>1);
	 }
	 assignment {
		fprintf(fasm, "\tjmp loop_start_%d\n", $<my_nlabel>1);
	 }
	 RPARENT {
		fprintf(fasm, "\tloop_body_start_%d:\n", $<my_nlabel>1);
	 }
	 statement {
		fprintf(fasm, "\tjmp loop_assignment_%d\n", $<my_nlabel>1);
		fprintf(fasm, "loop_end_%d:\n", $<my_nlabel>1);
	 }
	 | jump_statement
	 ;

else_optional:
         ELSE  statement 
	 | /* empty */ 
         ;

jump_statement:
     CONTINUE SEMICOLON {
		$<my_nlabel>1=nlabel;
		fprintf(fasm, "\n\t# CONTINUE\n");
		fprintf(fasm, "\tjmp loop_continue_%d\n", --$<my_nlabel>1);
	 }
	 | BREAK SEMICOLON {
		$<my_nlabel>1=nlabel;
		fprintf(fasm, "\n\t# BREAK\n");
		fprintf(fasm, "\tjmp loop_end_%d\n", --$<my_nlabel>1);
	 }
	 | RETURN expression SEMICOLON {
		 fprintf(fasm, "\tmovq %%rbx, %%rax\n");
		 top = 0;
	 }
	 ;

%%

void yyset_in (FILE *  in_str );

int
yyerror(const char * s)
{
	fprintf(stderr,"%s:%d: %s\n", input_file, line_number, s);
}


int
main(int argc, char **argv)
{
	printf("-------------WARNING: You need to implement global and local vars ------\n");
	printf("------------- or you may get problems with top------\n");
	
	// Make sure there are enough arguments
	if (argc <2) {
		fprintf(stderr, "Usage: simple file\n");
		exit(1);
	}

	// Get file name
	input_file = strdup(argv[1]);

	int len = strlen(input_file);
	if (len < 2 || input_file[len-2]!='.' || input_file[len-1]!='c') {
		fprintf(stderr, "Error: file extension is not .c\n");
		exit(1);
	}

	// Get assembly file name
	asm_file = strdup(input_file);
	asm_file[len-1]='s';

	// Open file to compile
	FILE * f = fopen(input_file, "r");
	if (f==NULL) {
		fprintf(stderr, "Cannot open file %s\n", input_file);
		perror("fopen");
		exit(1);
	}

	// Create assembly file
	fasm = fopen(asm_file, "w");
	if (fasm==NULL) {
		fprintf(stderr, "Cannot open file %s\n", asm_file);
		perror("fopen");
		exit(1);
	}

	// Uncomment for debugging
	//fasm = stderr;

	// Create compilation file
	// 
	yyset_in(f);
	yyparse();

	// Generate string table
	int i;
	for (i = 0; i<nstrings; i++) {
		fprintf(fasm, "string%d:\n", i);
		fprintf(fasm, "\t.string %s\n\n", string_table[i]);
	}

	fclose(f);
	fclose(fasm);

	return 0;
}
