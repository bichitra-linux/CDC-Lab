%{
    #include <stdio.h>
    int word_count = 0; // Move declaration here
%}

%%

[a-zA-Z]+      { 
                    word_count++; 
                    printf("Matched word: %s\n", yytext); 
                }
[ \t\n]+       { /* ignore whitespace */ }
.              { 
                    printf("Ignored character: %s\n", yytext); 
                }

<<EOF>>        { return 0; }

%%

int main() {
    printf("Enter text (ctrl+D to end on Linux or ctrl+Z on Windows):\n");
    yylex(); // Capture result
    printf("Number of words = %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}
