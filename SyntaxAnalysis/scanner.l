%{
#include <stdio.h>
#include "y.tab.h" // 由 yacc -d 生成
%}

charset {letter}|{singleNumber}|{Bracket}
letter [A-Za-z]
singleNumber [0-9]
Bracket "+"|"-"|"*"|"/"|"="|"<"|">"|"\("|"\)"|"\["|"\]"|"\{"|"\}"|";"|","|":"|"."|"'"

Positive [1-9]

words {conserveWords}|{DoubleBrackets}|{identifier}|{integer}|{Bracket}
conserveWords and│array│begin│bool│call│case│char│constant│dim│do│else│end│false│for│if│input│integer│not│of│or│output│procedure│program│read│real│repeat│set│stop│then│to│true│until│var│while│write
DoubleBrackets <>│<=│>=│:=│/*│*/│..
identifier {letter}({letter}|{singleNumber})*
const_identifier {integer}|{CONSTBool}|{CONSTString}
integer {Positive}(singleNumber)*
CONSTBool true|false
CONSTString (([^'])*^{Bracket})


%%
[ \t\r\a]+	;
[\n]	     return LF;
and          return AND;
array        return ARRAY;
begin        return Begin;
bool         return BOOL;
call         return CALL;
case         return CASE;
char         return CHAR;
constant     return CONST;
dim          return DIM;
do           return DO;
else         return ELSE;
end          return END;
false        return False;
for          return FOR;
if           return IF;
input        return INPUT;
integer      return Int;
not          return NOT;
of           return OF;
or           return OR;
output       return OUTPUT;
procedure    return PROCEDURE;
program		 return PROGRAM;
read         return READ;
real         return REAL;
repeat       return REPEAT;
set          return SET;
stop         return STOP;
then         return THEN;
to           return TO;
true         return True;
until        return UNTIL;
var			return VAR;
while		return WHILE;
write		return WRITE;
{identifier} yylval.str = strdup(yytext); return IDENTIFIER;
{integer} yylval.num = atoi(yytext); return INTEGER;

"("		return LEFTBRACKET;
")"		return RIGHTBRACKET;
"*"		return MUL;
"*/"	return MULDIV;
"+"		return ADD;
","		return DOUHAO;
"-"		return SUB;
"."		return DOT;
".."	return DOTDOT;
"/"		return DIV;
"/*"	return DIVMUL;
":"		return MAOHAO;
":="	return FUZHI;
";"		return FENHAO;
"<"		return XIAOYU;
"<="	return XIAOYUDENGYU;
"<>"	return JIANKUOHAO;
"="		return DENGHAO;
">"		return DAYU;
">="	return DAYUDENGYU;
"["		return ZUOZHONGKUOHAO;
"]"		return YOUZHONGKUOHAO;
"'"     return YINHAO;
%%

/* 测试词法分析器是否正确 */

// int main(int argc,char const *argv[]){
// 	printf("Hello Ms. Tang. My name is Mo Ni, the number is 202130441436. Here is my work:(*_*)\n");
// 	int type=0;
// 	while(type=yylex()){
// 		printf("(%d,'%s')\n",type,yytext);
// 	}
// 	return 0;
// }
// int yywrap(){
// 	return 1;
// }