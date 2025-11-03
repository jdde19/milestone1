%{
    #include "fishball.tab.h"
%}

COMMENT (BTW.*)
IDENTIFIER [A-Za-z][A-Za-z0-9_]*
YARN \"[^\"]*\"
NUMBAR (\-)?[0-9]*\.[0-9]+
NUMBR (\-)?[0-9]+

%%
"HAI" {
    printf("Start of program\n");
    return HAI;
}
"KTHXBYE" {
    printf("End of program\n");
    return KTHXBYE;
}
"WAZZUP" {return WAZZUP;}
"BUHBYE" {return BUHBYE;}
"I HAS A" {return DECLARATION;}
"VISIBLE" {return VISIBLE;}
"SUM OF" {return SUM;}
"DIFF OF" {return DIFF;}
"PRODUKT OF" {return PRODUCT;}
"QUOSHUNT OF" {return QUOTIENT;}
"MOD OF" {return MOD;}
"BIGGR OF" {return BIGGER;}
"SMALLR OF" {return SMALLER;}
"AN" {
    printf("Multiple parameter separator: AN\n");
    return AN;
}
"ITZ" {return ITZ;}

{IDENTIFIER} {
        yylval.sval = strdup(yytext);
        return IDENTIFIER; 
    }
{COMMENT} { /* nothing */ }
{YARN} {
    yylval.sval = strdup(yytext);
    return YARN;}
{NUMBAR} {
    yylval.fval = (float)atoi(yytext);
    return NUMBAR;}
{NUMBR} {
    yylval.ival = atoi(yytext);
    return NUMBR;}
\n {return LINEBREAK;}
[ \t] 
%%