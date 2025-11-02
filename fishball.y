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
%token VISIBLE STRING
%type assignment declaration
%type statement 
%type print
%type single_comment

%%
start: 
    | single_comment start
    | HAI LINEBREAK statement KTHXBYE LINEBREAK{
        printf("foo\n");
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
    | DECLARATION IDENTIFIER LINEBREAK declaration

print:
    | VISIBLE IDENTIFIER LINEBREAK print 
    | VISIBLE STRING LINEBREAK print

single_comment:
    SINGLE_COMMENT LINEBREAK
%%

void yyerror(char *s)
{
    fprintf(stderr, "error\n");
}

int main(int argc, char **argv)
{
    yyparse();
}