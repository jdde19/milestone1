%{
    #include "fishball.tab.h"
%}

COMMENT (BTW.*)
IDENTIFIER [A-Za-z][A-Za-z0-9_]*
STRING \"[^\"]*\"

%%
"HAI" {return HAI;}
"KTHXBYE" {return KTHXBYE;}
"WAZZUP" {return WAZZUP;}
"BUHBYE" {return BUHBYE;}
"I HAS A" {return DECLARATION;}
"VISIBLE" {return VISIBLE;}

{IDENTIFIER} {return IDENTIFIER;}
{COMMENT} {return SINGLE_COMMENT;}
{STRING} {return STRING;}
\n {return LINEBREAK;}
[ \t] 
%%