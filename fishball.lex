%{
    #include "fishball.tab.h"
%}

COMMENT (BTW.*)
IDENTIFIER [A-Za-z][A-Za-z0-9_]*
YARN \"[^\"]*\"
NUMBAR (\-)?[0-9]*\.[0-9]+
NUMBR (\-)?[0-9]+

%%
"HAI" {return HAI;}
"KTHXBYE" {return KTHXBYE;}
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
"AN" {return AN;}
"ITZ" {return ITZ;}

{IDENTIFIER} {return IDENTIFIER;}
{COMMENT} {return SINGLE_COMMENT;}
{YARN} {return YARN;}
{NUMBAR} {return NUMBAR;}
{NUMBR} {return NUMBR;}
\n {return LINEBREAK;}
[ \t] 
%%