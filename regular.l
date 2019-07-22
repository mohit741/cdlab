%{  
#include <stdlib.h>
#include <stdio.h>
%}
A [a-zA-Z]
D [0-9]
%%
A(A+D)* { printf("%s\n",yytext); }
%%
main(argc, argv)
int argc;
char** argv;
{           
if (argc > 1)
{
    FILE *file;
    file = fopen(argv[1], "r");
    if (!file)
    {
        fprintf(stderr, "Could not open %s\n", argv[1]);
        exit(1);
    }
    yyin = file;
}

yylex();
}
