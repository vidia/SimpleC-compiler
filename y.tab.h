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
extern YYSTYPE yylval;
