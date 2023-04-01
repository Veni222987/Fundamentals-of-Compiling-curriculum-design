%{
/* 包含所需头文件 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <String.h>

int lineNum=0;

int VarTNum=1;
int usedTNum=1;

typedef struct quateration{
    int num;
    char *arg1;
    char *arg2;
    char *result;
}quateration;

typedef struct list{
    quateration qua;
    struct list *next;
}list;

list* myhead=NULL;

// 将节点插入到链表之中
void insert(quateration qua,list *head){
    list *p = (list*)malloc(sizeof(list));
    p->qua = qua;
    p->next = NULL; 
    if(head == NULL){
        head = p;
        myhead = head;
    }else{
        while(head->next != NULL){
            head = head->next;
        }
        head->next = p;
    }
}

void print(list *head){
    while(head != NULL){
        printf("(%d)(%s,%s,%s,%s)\n",head->qua.num,head->qua.arg1,head->qua.arg2,head->qua.result);
        head = head->next;
    }
}


%}
/* 声明 token 供后续使用, 同时也可以在 lex 中使用， 相当于终结符*/

// 将实验1中的Lex识别结果搬过来
%token AND
%token ARRAY
%token Begin
%token BOOL
%token CALL
%token CASE
%token CHAR
%token CONST
%token DIM
%token DO
%token ELSE
%token END
%token False
%token FOR
%token IF
%token INPUT
%token Int
%token NOT
%token OF
%token OR
%token OUTPUT
%token PROCEDURE
%token PROGRAM
%token READ
%token REAL
%token REPEAT
%token SET
%token STOP
%token THEN
%token TO
%token True
%token UNTIL
%token VAR
%token WHILE
%token WRITE
%token LEFTBRACKET
%token RIGHTBRACKET
// %token MUL
%token MULDIV
// %token ADD
%token DOUHAO
// %token SUB
%token DOT
%token DOTDOT
// %token DIV
%token DIVMUL
%token MAOHAO
%left FUZHI
%token FENHAO
%token XIAOYU
%token XIAOYUDENGYU
%token JIANKUOHAO
%token DENGHAO
%token DAYU
%token DAYUDENGYU
%token ZUOZHONGKUOHAO
%token YOUZHONGKUOHAO
%token YINHAO
%token LF
/* %left 表示左结合, %right 表示右结合 */
/* 最后列出的定义具有最高的优先级 */
%left ADD SUB
%left MUL DIV

%token <num> INTEGER

%token <str> IDENTIFIER

%token <str> CONSTSTRING

/* 定义结构体, 使得 token 可以附带相应的数据信息(语义值) */
%union {
    int num;
    char *str;
}
/* 指明不同 token 或者 规则 的数据类型 ，尖括号内的字符串为变量名，尖括号里出现的类型都要在union中出现*/
%type <num> ArithmeticQuantity Factor Term ArithmeticExpression Expression BooleanQuantity BooleanFactor BooleanItem BooleanExpression

%type <str> CharExpression RELATION XIAOYU XIAOYUDENGYU DENGHAO DAYU DAYUDENGYU

/* 根据规定，YACC仅对第一条规则感兴趣, 或者使用 %start 符号指定的起始规则 start是文法的开始符号*/
%start S


%%
/* 冒号前面就是规则的产生式，冒号后面是规则的动作，动作中的$1 $2 $3 ... 依次表示匹配到的 token 所具有的值 */
S: ProgramIdentifier FENHAO VarDeclaration ComplexSentence DOT {
    // puts("found program");
    printf("(%d)(sys,-,-,-)",lineNum);
};

ProgramIdentifier: PROGRAM IDENTIFIER {
    puts("My name is Mo Ni. The student number is 202130441436.");
    printf("(%d)(program,%s,-,-)\n",lineNum, $2);
    lineNum++;
    // printf($2);
};

VarDeclaration: VAR VarDefinition {
    // puts("found var");
    // printf("(%d)(var,-,-,-)",2);
}| {// puts("no var");
    // printf("no var\n");
};

VarDefinition: VarDeclarationList MAOHAO Type FENHAO VarDefinition
| VarDeclarationList MAOHAO Type FENHAO {
    // printf("(%d)(varDefinition,-,-,-)",4);
};

VarDeclarationList: IDENTIFIER DOUHAO VarDeclarationList | IDENTIFIER {
    // printf("(%d)(varDeclarationList,-,-,-)%s",5, $1);
};

Type: Int | BOOL | CHAR {
    // puts("found type");
};

Sentence: FuzhiSentence | IfSentence | WhileSentence | RepeatSentence | ComplexSentence {
    // printf("found sentence\n");
};

FuzhiSentence: IDENTIFIER FUZHI ArithmeticExpression {
    // printf("found FUZHI sentence\n");
    // $1 = $3;
    // if(strcmp($3,"T")==0){
    //     printf("(%d)(:=,%s %d,-,%s) \n",lineNum, $3,VarTNum, $1);
    // };
    printf("(%d)(:=,%d,-,%s) \n",lineNum, $3, $1);
    lineNum++;
};

IfSentence: IF BooleanExpression THEN Sentence {
    // printf("found IF sentence\n");
}| IF BooleanExpression THEN Sentence ELSE Sentence {
    // printf("found IF sentence\n");
};

WhileSentence: WHILE BooleanExpression DO Sentence {
    // printf("found WHILE sentence\n");
};

RepeatSentence: REPEAT Sentence UNTIL BooleanExpression {
    // printf("found REPEAT sentence");
};

ComplexSentence: Begin SentenceList END {
    // printf("found ComplexSentence\n");
};

SentenceList: Sentence FENHAO SentenceList | Sentence {
    // printf("found SentenceList\n");
};

Expression: ArithmeticExpression | BooleanExpression  {
    // printf("found Expression");
};

ArithmeticExpression: ArithmeticExpression ADD Term {printf("(%d)(+,%s,%d,T%d)\n",lineNum, $1, $3,VarTNum);lineNum++;VarTNum++;} | ArithmeticExpression SUB Term {printf("(%d)(-,%s,%s,T%d)\n",lineNum, $1, $3,VarTNum);lineNum++;VarTNum++;} | Term ;

Term: Term MUL Factor {printf("(%d)(*,%s,%d,T%d)\n",lineNum, $1, $3,VarTNum);lineNum++;VarTNum++;} | Term DIV Factor {printf("(%d)(/,%s,%d,T%d)\n",lineNum, $1, $3,VarTNum);lineNum++;VarTNum++;} | Factor {
    // printf("found Term");
};

Factor: ArithmeticQuantity | SUB Factor {
    // printf("found Factor");
};

ArithmeticQuantity: INTEGER | IDENTIFIER | LEFTBRACKET ArithmeticExpression RIGHTBRACKET {
    // printf("found ArithmeticQuantity");
};

BooleanExpression: BooleanExpression OR BooleanItem | BooleanItem {
    // printf("found BooleanExpression\n");
};

BooleanItem: BooleanItem AND BooleanFactor | BooleanFactor {
    // printf("found BooleanItem\n");
};

BooleanFactor: BooleanQuantity | NOT BooleanFactor {
    // printf("found BooleanFactor\n");
};


BooleanQuantity: constBOOLEAN
| IDENTIFIER | LEFTBRACKET BooleanExpression RIGHTBRACKET
| IDENTIFIER RELATION IDENTIFIER {
    printf("(%d)(j%s,%s,%s,%d)\n",lineNum,$2,$1, $3,lineNum+2);
    lineNum++;
    printf("(%d)(j,-,-,%d)\n",lineNum,0);
    lineNum++;
}| ArithmeticExpression RELATION ArithmeticExpression {
    printf("(%d)(j%s,%s,%s,%d)\n",lineNum,$2,$1, $3,lineNum+2);
    lineNum++;
    printf("(%d)(j,-,-,%d)\n",lineNum,0); 
    lineNum++;
};

// 布尔常量的命名
constBOOLEAN: True | False {
    // printf("found constBOOLEAN\n");
};

RELATION: XIAOYU{
    $$="<";
}  | XIAOYUDENGYU{
    $$="<=";
} | DAYUDENGYU {
    $$=">=";
} | DAYU {
    $$= ">";
} | DENGHAO {
    $$= "=";
};

// CharExpression: CONSTSTRING {
//     // $$=$1;
//     }| IDENTIFIER {
//     $$=$1;
// };



%%
int main() {
    // int count = 0;
    extern FILE *yyin;
    yyin = stdin;
    yyparse();
    return 0;
}
// Linux 下注释掉这个函数
void yyerror(char *msg) {
    printf("Error encountered: %s \n", msg);
}
// Linux 下注释掉这个函数
int yywrap(){
    return 1;
}

// 两个待解决的问题：identifier匹配不准确，以及全局变量的命名，使用。T1,T2...的生成与使用
// yytext匹配到的永远是规则的产生式的最后一个token，而不是某个token的值
