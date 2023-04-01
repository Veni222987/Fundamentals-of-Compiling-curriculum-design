/* A Bison parser, made by GNU Bison 3.4.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    ARRAY = 259,
    Begin = 260,
    BOOL = 261,
    CALL = 262,
    CASE = 263,
    CHAR = 264,
    CONST = 265,
    DIM = 266,
    DO = 267,
    ELSE = 268,
    END = 269,
    False = 270,
    FOR = 271,
    IF = 272,
    INPUT = 273,
    Int = 274,
    NOT = 275,
    OF = 276,
    OR = 277,
    OUTPUT = 278,
    PROCEDURE = 279,
    PROGRAM = 280,
    READ = 281,
    REAL = 282,
    REPEAT = 283,
    SET = 284,
    STOP = 285,
    THEN = 286,
    TO = 287,
    True = 288,
    UNTIL = 289,
    VAR = 290,
    WHILE = 291,
    WRITE = 292,
    LEFTBRACKET = 293,
    RIGHTBRACKET = 294,
    MULDIV = 295,
    DOUHAO = 296,
    DOT = 297,
    DOTDOT = 298,
    DIVMUL = 299,
    MAOHAO = 300,
    FUZHI = 301,
    FENHAO = 302,
    XIAOYU = 303,
    XIAOYUDENGYU = 304,
    JIANKUOHAO = 305,
    DENGHAO = 306,
    DAYU = 307,
    DAYUDENGYU = 308,
    ZUOZHONGKUOHAO = 309,
    YOUZHONGKUOHAO = 310,
    YINHAO = 311,
    LF = 312,
    ADD = 313,
    SUB = 314,
    MUL = 315,
    DIV = 316,
    INTEGER = 317,
    IDENTIFIER = 318,
    CONSTSTRING = 319
  };
#endif
/* Tokens.  */
#define AND 258
#define ARRAY 259
#define Begin 260
#define BOOL 261
#define CALL 262
#define CASE 263
#define CHAR 264
#define CONST 265
#define DIM 266
#define DO 267
#define ELSE 268
#define END 269
#define False 270
#define FOR 271
#define IF 272
#define INPUT 273
#define Int 274
#define NOT 275
#define OF 276
#define OR 277
#define OUTPUT 278
#define PROCEDURE 279
#define PROGRAM 280
#define READ 281
#define REAL 282
#define REPEAT 283
#define SET 284
#define STOP 285
#define THEN 286
#define TO 287
#define True 288
#define UNTIL 289
#define VAR 290
#define WHILE 291
#define WRITE 292
#define LEFTBRACKET 293
#define RIGHTBRACKET 294
#define MULDIV 295
#define DOUHAO 296
#define DOT 297
#define DOTDOT 298
#define DIVMUL 299
#define MAOHAO 300
#define FUZHI 301
#define FENHAO 302
#define XIAOYU 303
#define XIAOYUDENGYU 304
#define JIANKUOHAO 305
#define DENGHAO 306
#define DAYU 307
#define DAYUDENGYU 308
#define ZUOZHONGKUOHAO 309
#define YOUZHONGKUOHAO 310
#define YINHAO 311
#define LF 312
#define ADD 313
#define SUB 314
#define MUL 315
#define DIV 316
#define INTEGER 317
#define IDENTIFIER 318
#define CONSTSTRING 319

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 126 "parser.y"

    int num;
    char *str;

#line 190 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
