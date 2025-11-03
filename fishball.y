%{
    #include <stdio.h>
    #include <math.h>
    #include <string.h>
    #include <stdlib.h>

    int yylex();
    void yyerror(char *s);
    int x;
%}


%token HAI KTHXBYE LINEBREAK IDENTIFIER 
%token DECLARATION WAZZUP BUHBYE
%token SINGLE_COMMENT
%token VISIBLE 
%token YARN NUMBAR NUMBR
%token SUM DIFF PRODUCT QUOTIENT MOD BIGGER SMALLER
%token AN ITZ
%type assignment declaration
%type statement 
%type print
%type single_comment
%type expr arithmetic_expr literal

%%
start: 
    | single_comment start
    | HAI LINEBREAK statement KTHXBYE LINEBREAK{
        printf("foo\n");
        return 0;
    }
    ;

statement: 
    | LINEBREAK statement
    | assignment statement 
    | print statement
    | single_comment statement
    ;


assignment:
    WAZZUP LINEBREAK declaration BUHBYE LINEBREAK

declaration:
    | single_comment declaration
    | LINEBREAK declaration // made this so that empty lines are not recognized as error
    | DECLARATION IDENTIFIER LINEBREAK declaration
    | DECLARATION IDENTIFIER ITZ expr LINEBREAK declaration

print:
    | VISIBLE expr LINEBREAK print 

single_comment:
    SINGLE_COMMENT LINEBREAK
    ;

expr: 
    literal
    | arithmetic_expr
    | IDENTIFIER
    ;

arithmetic_expr:
    SUM expr AN expr
    | DIFF expr AN expr
    | PRODUCT expr AN expr
    | QUOTIENT expr AN expr
    | MOD expr AN expr
    | BIGGER expr AN expr
    | SMALLER expr AN expr
    ;


literal: 
    YARN
    | NUMBR
    | NUMBAR
    ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error\n");
}

int main(int argc, char **argv)
{
    yyparse();
}