%{
    #include <stdio.h>
    #include <math.h>
    #include <string.h>
    #include <stdlib.h>

    int yylex();
    void yyerror(char *s);
    int x;
%}

%union 
{
    int ival; 
    float fval;    
    char* sval;  
}


%token HAI KTHXBYE LINEBREAK 
%token DECLARATION WAZZUP BUHBYE
%token VISIBLE 
%token <sval> YARN IDENTIFIER
%token <fval> NUMBAR 
%token <ival> NUMBR
%token SUM DIFF PRODUCT QUOTIENT MOD BIGGER SMALLER
%token AN ITZ
%type assignment declaration
%type statement 
%type print
%type expr arithmetic_expr literal

%%
start: 
    | HAI LINEBREAK statement KTHXBYE LINEBREAK{
        printf("read successfully\n");
        return 0;
    }
    | LINEBREAK HAI LINEBREAK statement KTHXBYE LINEBREAK{
        printf("read successfully\n");
        return 0;
    }
    ;

statement: 
    | LINEBREAK statement
    | assignment statement 
    | print statement
    ;

assignment:
    WAZZUP LINEBREAK declaration BUHBYE LINEBREAK

declaration:
    | LINEBREAK declaration // made this so that empty lines are not recognized as error
    | DECLARATION IDENTIFIER LINEBREAK declaration
    | DECLARATION IDENTIFIER ITZ expr LINEBREAK declaration

print:
    | VISIBLE expr LINEBREAK print 

expr: 
    literal
    | arithmetic_expr
    | IDENTIFIER
    ;

arithmetic_expr:
    SUM expr AN expr {printf("Arithmetic expression: SUM OF\n");}
    | DIFF expr AN expr {printf("Arithmetic expression: DIFF OF\n");}
    | PRODUCT expr AN expr {printf("Arithmetic expression: PRODUCT OF\n");}
    | QUOTIENT expr AN expr {printf("Arithmetic expression: QUOTIENT OF\n");}
    | MOD expr AN expr {printf("Arithmetic expression: MOD OF\n");}
    | BIGGER expr AN expr {printf("Arithmetic expression: BIGGR OF\n");}
    | SMALLER expr AN expr {printf("Arithmetic expression: SMALLR OF\n");}
    ;


literal: 
    YARN {printf("YARN: %s\n", $1);}
    | NUMBR {printf("NUMBR: %i\n", $1);}
    | NUMBAR {printf("NUMBAR: %.1lf\n", $1);}
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