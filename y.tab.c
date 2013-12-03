#ifndef lint
static const char yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93";
#endif

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20120115

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)

#define YYPREFIX "yy"

#define YYPURE 0

#line 12 "simple.y"
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union	{
		char   *string_val;
		int nargs;
		int my_nlabel;
	} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
#line 19 "simple.y"
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

int loop_nest = 0; 

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

#line 114 "y.tab.c"

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define WORD 257
#define NOTOKEN 258
#define LPARENT 259
#define RPARENT 260
#define LBRACE 261
#define RBRACE 262
#define LCURLY 263
#define RCURLY 264
#define COMA 265
#define SEMICOLON 266
#define EQUAL 267
#define STRING_CONST 268
#define LONG 269
#define LONGSTAR 270
#define VOID 271
#define CHARSTAR 272
#define CHARSTARSTAR 273
#define INTEGER_CONST 274
#define AMPERSAND 275
#define OROR 276
#define ANDAND 277
#define EQUALEQUAL 278
#define NOTEQUAL 279
#define LESS 280
#define GREAT 281
#define LESSEQUAL 282
#define GREATEQUAL 283
#define PLUS 284
#define MINUS 285
#define TIMES 286
#define DIVIDE 287
#define PERCENT 288
#define IF 289
#define ELSE 290
#define WHILE 291
#define DO 292
#define FOR 293
#define CONTINUE 294
#define BREAK 295
#define RETURN 296
#define YYERRCODE 256
static const short yylhs[] = {                           -1,
    0,    1,    2,    2,    2,    6,    9,    3,   10,   10,
    7,    7,   11,    4,   12,   12,    5,    5,    5,    5,
    5,   13,   13,   15,   17,   17,   16,   16,   14,   18,
   18,   19,   19,   20,   20,   20,   21,   21,   21,   21,
   21,   22,   22,   22,   23,   23,   23,   23,   24,   24,
   24,   24,   24,   24,   24,    8,   25,   25,   27,   28,
   28,   26,   26,   26,   26,   29,   31,   26,   32,   33,
   26,   34,   35,   26,   36,   37,   38,   39,   40,   26,
   26,   30,   30,   41,   41,   41,
};
static const short yylen[] = {                            2,
    1,    1,    2,    2,    0,    0,    0,    8,    1,    3,
    1,    0,    2,    3,    1,    3,    1,    1,    1,    1,
    1,    3,    6,    4,    1,    3,    1,    0,    1,    1,
    3,    1,    3,    1,    3,    3,    1,    3,    3,    3,
    3,    1,    3,    3,    1,    3,    3,    3,    1,    1,
    1,    4,    2,    1,    3,    3,    2,    0,    3,    1,
    3,    2,    2,    1,    1,    0,    0,    8,    0,    0,
    7,    0,    0,    9,    0,    0,    0,    0,    0,   14,
    1,    2,    0,    2,    2,    3,
};
static const short yydefred[] = {                         5,
    0,    1,    0,   19,   20,   21,   17,   18,    3,    4,
    0,    0,    0,    0,    0,   14,    0,   16,    0,    0,
    0,    9,   13,    7,    0,    0,   10,   58,    8,    0,
    0,   56,    0,    0,   72,    0,    0,    0,    0,    0,
   65,    0,    0,   57,   64,   81,    0,    0,    0,    0,
   69,    0,    0,   84,   85,    0,    0,   49,   54,    0,
    0,   50,    0,    0,    0,    0,    0,    0,   45,   60,
    0,   62,   63,   25,    0,    0,    0,   22,    0,    0,
    0,    0,    0,    0,    0,   53,   86,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,   59,   24,    0,    0,   66,    0,    0,   75,    0,
   55,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,   46,   47,   48,   61,   26,    0,    0,   70,    0,
    0,   52,   23,   67,    0,   73,   76,    0,   71,    0,
    0,    0,   68,    0,   77,   82,   74,    0,   78,    0,
   79,    0,   80,
};
static const short yydgoto[] = {                          1,
    2,    3,    9,   10,   40,   14,   20,   41,   26,   21,
   22,   13,   42,   61,   62,   75,   76,   63,   64,   65,
   66,   67,   68,   69,   30,   44,   45,   71,  128,  143,
  138,   80,  135,   52,  140,  131,  141,  148,  150,  152,
   46,
};
static const short yysindex[] = {                         0,
    0,    0, -191,    0,    0,    0,    0,    0,    0,    0,
 -255,    0, -245, -247, -241,    0, -191,    0, -223, -231,
 -221,    0,    0,    0, -191, -207,    0,    0,    0, -246,
 -228,    0, -200, -196,    0, -176, -166, -159,   77, -154,
    0, -153, -147,    0,    0,    0,   77,   77,   77,   77,
    0, -155, -146,    0,    0, -229,   77,    0,    0, -130,
 -133,    0, -141, -121, -203, -214, -198, -163,    0,    0,
 -136,    0,    0,    0,  -78,  -81,  -77,    0,  -72,   77,
 -102, -248,  -76,   77,  -69,    0,    0,   77,   77,   77,
   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
  -65,    0,    0,   77,  -74,    0,  -66,  -64,    0,  -54,
    0, -121, -203, -214, -214, -198, -198, -198, -198, -163,
 -163,    0,    0,    0,    0,    0,   77, -155,    0,   77,
   77,    0,    0,    0, -155,    0,    0,  -94,    0,  -50,
  -55, -155,    0,  -52,    0,    0,    0, -146,    0,  -45,
    0, -155,    0,
};
static const short yyrindex[] = {                         0,
    0,    0,  216,    0,    0,    0,    0,    0,    0,    0,
    0, -256,    0,    0,    0,    0,  -43,    0,    0,    0,
  -41,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,  -40,    0,    0,    0,
    0,    0,    0,    0,    0, -134,    0,    0,    0,    0,
    0,    0, -205,   93, -156, -225,  -27, -105,    0,    0,
    0,    0,    0,    0,    0,  -39,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,  100,   73,   45,   65,  -19,    5,   13,   37,  -79,
  -53,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0, -199,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,    0,    0,
};
static const short yygindex[] = {                         0,
    0,    0,    0,    0,   11,    0,    0,  192,    0,    0,
  197,    0,  -49,  -42,  -30,    0,    0,    0,  146,  147,
   79,   70,   62,   68,    0,  -51,    0,    0,    0,    0,
    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
    0,
};
#define YYTABLESIZE 376
static const short yytable[] = {                         43,
   81,   12,    6,   83,   74,   77,   78,   79,   15,   15,
   31,   17,   48,   11,   85,   18,   28,   32,   49,   15,
   16,   43,    4,    5,    6,    7,    8,   19,   24,   47,
   47,   84,   48,   23,   34,   19,   34,  107,   49,   34,
   34,  110,   33,   25,   34,   35,   36,   37,   38,   39,
   34,   34,   34,   34,   29,   28,   29,   83,   50,   29,
   29,  126,   51,   83,   83,   92,   93,   94,   95,   83,
   83,   83,   83,   83,   90,   91,  134,    4,    5,    6,
    7,    8,   53,  139,  133,   96,   97,  136,  137,   83,
  146,   83,   83,   83,   83,   83,   83,   43,  149,   54,
  153,   31,   70,   32,   43,   32,   55,   28,   32,   32,
   82,   43,   72,    4,    5,    6,    7,    8,   73,   32,
   32,   43,   98,   99,  100,   51,   86,   51,  101,  102,
   51,   51,   87,   33,   88,   34,   35,   36,   37,   38,
   39,   51,   51,   51,   51,   51,   51,   51,   51,   51,
   51,   51,   51,   51,   42,   89,   42,  120,  121,   42,
   42,  116,  117,  118,  119,  122,  123,  124,  114,  115,
   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
   43,  103,   43,  104,  105,   43,   43,  106,  108,  109,
  111,  125,  127,  129,  130,  142,   43,   43,   43,   43,
   43,   43,   43,   43,   43,   43,   44,  132,   44,  144,
  145,   44,   44,  147,  151,    2,   12,   29,   11,   28,
   27,   27,   44,   44,   44,   44,   44,   44,   44,   44,
   44,   44,   37,  112,   37,  113,    0,   37,   37,    0,
   38,    0,   38,    0,    0,   38,   38,    0,   37,   37,
   37,   37,   37,   37,   37,   37,   38,   38,   38,   38,
   38,   38,   38,   38,   39,    0,   39,    0,    0,   39,
   39,    0,   40,    0,   40,    0,    0,   40,   40,    0,
   39,   39,   39,   39,   39,   39,   39,   39,   40,   40,
   40,   40,   40,   40,   40,   40,   41,    0,   41,    0,
    0,   41,   41,    0,   35,    0,   35,    0,    0,   35,
   35,    0,   41,   41,   41,   41,   41,   41,   41,   41,
   35,   35,   35,   35,   36,    0,   36,    0,    0,   36,
   36,    0,   33,   56,   33,   57,    0,   33,   33,    0,
   36,   36,   36,   36,   58,    0,    0,    0,   33,   33,
   59,   60,   30,    0,   30,    0,    0,   30,   30,   31,
    0,   31,    0,    0,   31,   31,    0,    0,   30,    0,
    0,    0,    0,    0,    0,   31,
};
static const short yycheck[] = {                         30,
   52,  257,  259,   53,   47,   48,   49,   50,  265,  266,
  257,  259,  261,    3,   57,  257,  263,  264,  267,  265,
  266,   52,  269,  270,  271,  272,  273,   17,  260,  259,
  259,  261,  261,  257,  260,   25,  262,   80,  267,  265,
  266,   84,  289,  265,  291,  292,  293,  294,  295,  296,
  276,  277,  278,  279,  260,  263,  262,  257,  259,  265,
  266,  104,  259,  263,  264,  280,  281,  282,  283,  269,
  270,  271,  272,  273,  278,  279,  128,  269,  270,  271,
  272,  273,  259,  135,  127,  284,  285,  130,  131,  289,
  142,  291,  292,  293,  294,  295,  296,  128,  148,  266,
  152,  257,  257,  260,  135,  262,  266,  263,  265,  266,
  257,  142,  266,  269,  270,  271,  272,  273,  266,  276,
  277,  152,  286,  287,  288,  260,  257,  262,  265,  266,
  265,  266,  266,  289,  276,  291,  292,  293,  294,  295,
  296,  276,  277,  278,  279,  280,  281,  282,  283,  284,
  285,  286,  287,  288,  260,  277,  262,   96,   97,  265,
  266,   92,   93,   94,   95,   98,   99,  100,   90,   91,
  276,  277,  278,  279,  280,  281,  282,  283,  284,  285,
  260,  260,  262,  265,  262,  265,  266,  260,  291,  266,
  260,  257,  267,  260,  259,  290,  276,  277,  278,  279,
  280,  281,  282,  283,  284,  285,  260,  262,  262,  260,
  266,  265,  266,  266,  260,    0,  260,   26,  260,  260,
  260,   25,  276,  277,  278,  279,  280,  281,  282,  283,
  284,  285,  260,   88,  262,   89,   -1,  265,  266,   -1,
  260,   -1,  262,   -1,   -1,  265,  266,   -1,  276,  277,
  278,  279,  280,  281,  282,  283,  276,  277,  278,  279,
  280,  281,  282,  283,  260,   -1,  262,   -1,   -1,  265,
  266,   -1,  260,   -1,  262,   -1,   -1,  265,  266,   -1,
  276,  277,  278,  279,  280,  281,  282,  283,  276,  277,
  278,  279,  280,  281,  282,  283,  260,   -1,  262,   -1,
   -1,  265,  266,   -1,  260,   -1,  262,   -1,   -1,  265,
  266,   -1,  276,  277,  278,  279,  280,  281,  282,  283,
  276,  277,  278,  279,  260,   -1,  262,   -1,   -1,  265,
  266,   -1,  260,  257,  262,  259,   -1,  265,  266,   -1,
  276,  277,  278,  279,  268,   -1,   -1,   -1,  276,  277,
  274,  275,  260,   -1,  262,   -1,   -1,  265,  266,  260,
   -1,  262,   -1,   -1,  265,  266,   -1,   -1,  276,   -1,
   -1,   -1,   -1,   -1,   -1,  276,
};
#define YYFINAL 1
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 296
#if YYDEBUG
static const char *yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"WORD","NOTOKEN","LPARENT",
"RPARENT","LBRACE","RBRACE","LCURLY","RCURLY","COMA","SEMICOLON","EQUAL",
"STRING_CONST","LONG","LONGSTAR","VOID","CHARSTAR","CHARSTARSTAR",
"INTEGER_CONST","AMPERSAND","OROR","ANDAND","EQUALEQUAL","NOTEQUAL","LESS",
"GREAT","LESSEQUAL","GREATEQUAL","PLUS","MINUS","TIMES","DIVIDE","PERCENT","IF",
"ELSE","WHILE","DO","FOR","CONTINUE","BREAK","RETURN",
};
static const char *yyrule[] = {
"$accept : goal",
"goal : program",
"program : function_or_var_list",
"function_or_var_list : function_or_var_list function",
"function_or_var_list : function_or_var_list global_var",
"function_or_var_list :",
"$$1 :",
"$$2 :",
"function : var_type WORD $$1 LPARENT arguments RPARENT $$2 compound_statement",
"arg_list : arg",
"arg_list : arg_list COMA arg",
"arguments : arg_list",
"arguments :",
"arg : var_type WORD",
"global_var : var_type global_var_list SEMICOLON",
"global_var_list : WORD",
"global_var_list : global_var_list COMA WORD",
"var_type : CHARSTAR",
"var_type : CHARSTARSTAR",
"var_type : LONG",
"var_type : LONGSTAR",
"var_type : VOID",
"assignment : WORD EQUAL expression",
"assignment : WORD LBRACE expression RBRACE EQUAL expression",
"call : WORD LPARENT call_arguments RPARENT",
"call_arg_list : expression",
"call_arg_list : call_arg_list COMA expression",
"call_arguments : call_arg_list",
"call_arguments :",
"expression : logical_or_expr",
"logical_or_expr : logical_and_expr",
"logical_or_expr : logical_or_expr OROR logical_and_expr",
"logical_and_expr : equality_expr",
"logical_and_expr : logical_and_expr ANDAND equality_expr",
"equality_expr : relational_expr",
"equality_expr : equality_expr EQUALEQUAL relational_expr",
"equality_expr : equality_expr NOTEQUAL relational_expr",
"relational_expr : additive_expr",
"relational_expr : relational_expr LESS additive_expr",
"relational_expr : relational_expr GREAT additive_expr",
"relational_expr : relational_expr LESSEQUAL additive_expr",
"relational_expr : relational_expr GREATEQUAL additive_expr",
"additive_expr : multiplicative_expr",
"additive_expr : additive_expr PLUS multiplicative_expr",
"additive_expr : additive_expr MINUS multiplicative_expr",
"multiplicative_expr : primary_expr",
"multiplicative_expr : multiplicative_expr TIMES primary_expr",
"multiplicative_expr : multiplicative_expr DIVIDE primary_expr",
"multiplicative_expr : multiplicative_expr PERCENT primary_expr",
"primary_expr : STRING_CONST",
"primary_expr : call",
"primary_expr : WORD",
"primary_expr : WORD LBRACE expression RBRACE",
"primary_expr : AMPERSAND WORD",
"primary_expr : INTEGER_CONST",
"primary_expr : LPARENT expression RPARENT",
"compound_statement : LCURLY statement_list RCURLY",
"statement_list : statement_list statement",
"statement_list :",
"local_var : var_type local_var_list SEMICOLON",
"local_var_list : WORD",
"local_var_list : local_var_list COMA WORD",
"statement : assignment SEMICOLON",
"statement : call SEMICOLON",
"statement : local_var",
"statement : compound_statement",
"$$3 :",
"$$4 :",
"statement : IF LPARENT expression RPARENT $$3 statement $$4 else_optional",
"$$5 :",
"$$6 :",
"statement : WHILE LPARENT $$5 expression RPARENT $$6 statement",
"$$7 :",
"$$8 :",
"statement : DO $$7 statement WHILE LPARENT expression $$8 RPARENT SEMICOLON",
"$$9 :",
"$$10 :",
"$$11 :",
"$$12 :",
"$$13 :",
"statement : FOR LPARENT assignment SEMICOLON $$9 expression $$10 SEMICOLON $$11 assignment $$12 RPARENT $$13 statement",
"statement : jump_statement",
"else_optional : ELSE statement",
"else_optional :",
"jump_statement : CONTINUE SEMICOLON",
"jump_statement : BREAK SEMICOLON",
"jump_statement : RETURN expression SEMICOLON",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 500
#define YYMAXDEPTH  500
#endif
#endif

#define YYINITSTACKSIZE 500

typedef struct {
    unsigned stacksize;
    short    *s_base;
    short    *s_mark;
    short    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 623 "simple.y"

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
#line 577 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    short *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return -1;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = data->s_mark - data->s_base;
    newss = (short *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return -1;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return -1;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack)) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = 0;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    yyerror("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == 0) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = 0;
            if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
            if (!yys) yys = "illegal-symbol";
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 6:
#line 118 "simple.y"
	{
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", yystack.l_mark[0].string_val);
		 fprintf(fasm, "%s:\n", yystack.l_mark[0].string_val);

		 fprintf(fasm, "# Save registers\n");
		 fprintf(fasm, "\tpushq %%rbx\n");
		 fprintf(fasm, "\tpushq %%r10\n");
		 fprintf(fasm, "\tpushq %%r13\n");
		 fprintf(fasm, "\tpushq %%r14\n");
		 fprintf(fasm, "\tpushq %%r15\n");
		 fprintf(fasm, "\tsubq $%d,%%rsp\n", 8*MAX_LOCALS); /* Reserve space for args and locals*/
		 nlocals = 0;

	 }
break;
case 7:
#line 134 "simple.y"
	{
		 int i;
		 fprintf(fasm, "\t#Save arguments\n");
		 for (i=0; i<nlocals;i++) {
		     fprintf(fasm, "\tmovq %%%s,%d(%%rsp)\n",
			     regArgs[i], 8*(MAX_LOCALS-i) );
		 }
         }
break;
case 8:
#line 143 "simple.y"
	{
		 fprintf(fasm, "\taddq $%d,%%rsp\n", 8*MAX_LOCALS); /* Restore space in stack for local vars*/
		 fprintf(fasm, "# Restore registers\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", yystack.l_mark[-6].string_val);
         }
break;
case 13:
#line 165 "simple.y"
	{
        char * id = yystack.l_mark[0].string_val;
        addLocalVar(id, 0/*current_type*/);
}
break;
case 15:
#line 174 "simple.y"
	{
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", yystack.l_mark[0].string_val); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
        }
break;
case 16:
#line 182 "simple.y"
	{
 	fprintf(fasm," # Reserve space\n");
	fprintf(fasm,"\t.data\n");
	fprintf(fasm, "%s:\n", yystack.l_mark[0].string_val); 
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm, "\t.long 0\n");
	fprintf(fasm,"\n");
}
break;
case 22:
#line 195 "simple.y"
	{

                 char * id = yystack.l_mark[-2].string_val;
                 int i = lookupLocalVar(id);
                 
                 if (i>=0) {
                         fprintf(fasm, "\t#Assign to Local var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n",
                                 regStk[top-1], 8*(MAX_LOCALS-i) );
                 }
                 else {
                         fprintf(fasm, "\t#Assign to Global var %s\n", id);
                         fprintf(fasm, "\tmovq %%%s, %s\n",
                                 regStk[top-1], id);
                 }
                 top--;
	 }
break;
case 24:
#line 216 "simple.y"
	{
		 char * funcName = yystack.l_mark[-3].string_val;
		 int nargs = yystack.l_mark[-1].nargs;
		 int i;
		 fprintf(fasm,"     # func=%s nargs=%d\n", funcName, nargs);
     		 fprintf(fasm,"     # Move values from reg stack to reg args\n");
		 for (i=nargs-1; i>=0; i--) {
			top--;
			fprintf(fasm, "\tmovq %%%s, %%%s\n",
			  regStk[top], regArgs[i]);
		 }
		 if (!strcmp(funcName, "printf")) {
			 /* printf has a variable number of arguments*/
			 /* and it need the following*/
			 fprintf(fasm, "\tmovl    $0, %%eax\n");
		 }
		 fprintf(fasm, "\tcall %s\n", funcName);
		 fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top]);
		 top++;
         }
break;
case 25:
#line 239 "simple.y"
	{
		yyval.nargs=1;
	 }
break;
case 26:
#line 242 "simple.y"
	{
		yyval.nargs++;
	 }
break;
case 27:
#line 249 "simple.y"
	{ yyval.nargs=yystack.l_mark[0].nargs; }
break;
case 28:
#line 250 "simple.y"
	{ yyval.nargs=0;}
break;
case 31:
#line 259 "simple.y"
	{
		fprintf(fasm, "\n\t#OROR\n");
		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
	 }
break;
case 33:
#line 268 "simple.y"
	{
		fprintf(fasm, "\n\t#ANDAND\n");
		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
	 }
break;
case 35:
#line 277 "simple.y"
	{
	 
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
break;
case 36:
#line 301 "simple.y"
	{
	 
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
break;
case 38:
#line 329 "simple.y"
	{
		fprintf(fasm, "\n\t# !=\n");
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
break;
case 39:
#line 342 "simple.y"
	{
		fprintf(fasm, "\n\t# !=\n");
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
break;
case 40:
#line 355 "simple.y"
	{
		fprintf(fasm, "\n\t# !=\n");
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
break;
case 41:
#line 368 "simple.y"
	{
		fprintf(fasm, "\n\t# !=\n");
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
break;
case 43:
#line 385 "simple.y"
	{
		fprintf(fasm,"\n\t# +\n");
		if (top<nregStk) {
			fprintf(fasm, "\taddq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
break;
case 44:
#line 393 "simple.y"
	{
		fprintf(fasm,"\n\t# -\n");
		if (top<nregStk) {
			fprintf(fasm, "\tsubq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
	  }
break;
case 46:
#line 405 "simple.y"
	{
		fprintf(fasm,"\n\t# *\n");
		if (top<nregStk) {
			fprintf(fasm, "\timulq %%%s,%%%s\n", 
				regStk[top-1], regStk[top-2]);
			top--;
		}
          }
break;
case 47:
#line 413 "simple.y"
	{
		fprintf(fasm,"\n\t# /\n");
		if (top<nregStk) {
			fprintf(fasm, "\tmovq $0, %rdx\n");
			fprintf(fasm, "\tmovq %%%s, %rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tmovq %rax, %%%s\n", regStk[top-2]);
			top--;
		}
      }
break;
case 48:
#line 423 "simple.y"
	{
		fprintf(fasm,"\n\t# /\n");
		if (top<nregStk) {
			fprintf(fasm, "\tmovq $0, %rdx\n");
			fprintf(fasm, "\tmovq %%%s, %rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tmovq %rdx, %%%s\n", regStk[top-2]);
			top--;
		}
      }
break;
case 49:
#line 436 "simple.y"
	{
		  /* Add string to string table.*/
		  /* String table will be produced later*/
		  string_table[nstrings]=yystack.l_mark[0].string_val;
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n",
			  yystack.l_mark[0].string_val, top);
		  if (top<nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", 
				nstrings, regStk[top]);
			/*fprintf(fasm, "\tmovq $%s,%%%s\n", */
				/*$<string_val>1, regStk[top]);*/
			top++;
		  }
		  nstrings++;
	  }
break;
case 51:
#line 453 "simple.y"
	{
  		/* Lookup local var*/
		 int i;
 	         char * id = yystack.l_mark[0].string_val;
		 i = lookupLocalVar(id);
		 if (i>=0) {
			 fprintf(fasm, "\t#Push Local var %s\n", id);
			 fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*(MAX_LOCALS-i), 
regStk[top] );
			 top++;
		 }
		 else {
			 /* Global var*/
			 fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			 top++;
		 }
	  }
break;
case 54:
#line 472 "simple.y"
	{
		  fprintf(fasm, "\n\t# push %s\n", yystack.l_mark[0].string_val);
		  if (top<nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", 
				yystack.l_mark[0].string_val, regStk[top]);
			top++;
		  }
	  }
break;
case 60:
#line 495 "simple.y"
	{
	addLocalVar(yystack.l_mark[0].string_val, current_type);
        }
break;
case 61:
#line 498 "simple.y"
	{
		addLocalVar(yystack.l_mark[0].string_val, current_type);
	}
break;
case 63:
#line 505 "simple.y"
	{
		top = 0;
	 }
break;
case 66:
#line 510 "simple.y"
	{
			ifLabelCounter++;
			fprintf(fasm, "\tcmpq $0, %%rbx\n");
			fprintf(fasm, "\tje ifEnd_%f\n", ifLabelCounter);
			/*fall through to statements...*/
			
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
break;
case 67:
#line 531 "simple.y"
	{
			fprintf(fasm, "\tjmp ifAbsEnd_%f\n", ifLabelCounter);
			fprintf(fasm, "\tifEnd_%f:\n", ifLabelCounter);
		}
break;
case 68:
#line 535 "simple.y"
	{
			fprintf(fasm, "\tifAbsEnd_%f:\n", ifLabelCounter);
		 }
break;
case 69:
#line 538 "simple.y"
	{
		/* act 1*/
		yystack.l_mark[-1].my_nlabel=nlabel;
		if(loop_nest == 0)
			nlabel++;
		loop_nest++;
		fprintf(fasm, "loop_start_%d_%d:\n", yystack.l_mark[-1].my_nlabel, loop_nest);
	 }
break;
case 70:
#line 546 "simple.y"
	{
		/* act2*/
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje loop_end_%d_%d\n", yystack.l_mark[-4].my_nlabel, loop_nest);
		top--;
         }
break;
case 71:
#line 552 "simple.y"
	{
		/* act3*/
		fprintf(fasm, "\tjmp loop_start_%d_%d\n", yystack.l_mark[-6].my_nlabel, loop_nest);
		fprintf(fasm, "loop_end_%d_%d:\n", yystack.l_mark[-6].my_nlabel, loop_nest);
		loop_nest--;
	 }
break;
case 72:
#line 558 "simple.y"
	{
		yystack.l_mark[0].my_nlabel=nlabel;
		if(loop_nest == 0)
			nlabel++;
		loop_nest++;
		fprintf(fasm, "loop_start_%d_%d:\n", yystack.l_mark[0].my_nlabel, loop_nest);
	 }
break;
case 73:
#line 565 "simple.y"
	{
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tjne loop_start_%d_%d\n", yystack.l_mark[-5].my_nlabel, loop_nest);
	 }
break;
case 74:
#line 569 "simple.y"
	{
		fprintf(fasm, "loop_end_%d_%d:\n", yystack.l_mark[-8].my_nlabel, loop_nest);
		loop_nest--;
	 }
break;
case 75:
#line 573 "simple.y"
	{
		yystack.l_mark[-3].my_nlabel=nlabel;
		if(loop_nest == 0)
			nlabel++;
		loop_nest++;
		fprintf(fasm, "loop_start_%d_%d:\n", yystack.l_mark[-3].my_nlabel, loop_nest);
	 }
break;
case 76:
#line 580 "simple.y"
	{
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje loop_end_%d_%d\n", yystack.l_mark[-5].my_nlabel, loop_nest);
		fprintf(fasm, "\tjne loop_body_start_%d_%d\n", yystack.l_mark[-5].my_nlabel, loop_nest);
		top--;
	 }
break;
case 77:
#line 586 "simple.y"
	{
		fprintf(fasm, "\tloop_assignment_%d_%d:\n", yystack.l_mark[-7].my_nlabel, loop_nest);
	 }
break;
case 78:
#line 589 "simple.y"
	{
		fprintf(fasm, "\tjmp loop_start_%d_%d\n", yystack.l_mark[-9].my_nlabel, loop_nest);
	 }
break;
case 79:
#line 592 "simple.y"
	{
		fprintf(fasm, "\tloop_body_start_%d_%d:\n", yystack.l_mark[-11].my_nlabel, loop_nest);
	 }
break;
case 80:
#line 595 "simple.y"
	{
		fprintf(fasm, "\tjmp loop_assignment_%d_%d\n", yystack.l_mark[-13].my_nlabel, loop_nest);
		fprintf(fasm, "loop_end_%d_%d:\n", yystack.l_mark[-13].my_nlabel, loop_nest);
		loop_nest--;
	 }
break;
case 84:
#line 609 "simple.y"
	{
		yystack.l_mark[-1].my_nlabel=nlabel;
		fprintf(fasm, "\tjmp loop_start_%d_%d\n", yystack.l_mark[-1].my_nlabel, loop_nest);
	 }
break;
case 85:
#line 613 "simple.y"
	{
		fprintf(fasm, "\tjmp loop_end_%d_%d\n", nlabel, loop_nest);
	 }
break;
case 86:
#line 616 "simple.y"
	{
		 fprintf(fasm, "\tmovq %%rbx, %%rax\n");
		 top = 0;
	 }
break;
#line 1333 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = 0;
#if YYDEBUG
            if (yydebug)
            {
                yys = 0;
                if (yychar <= YYMAXTOKEN) yys = yyname[yychar];
                if (!yys) yys = "illegal-symbol";
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == 0) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack))
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (short) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    yyerror("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}
