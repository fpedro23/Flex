/* 
 * Lexical Analysis: 
 * Description: For this assignment you will construct a lexical analyzer (scanner) for tiny C, a subset of the C language. The language 				recognizes the following tokens:

				Reserved words: “int” “float” “if” “then” “else” "while" “read” “write”
				Punctuation tokens: “,” “;” “(” “)” “{” “}”
				Relational tokens: “<” “=” "<=" ">=" "!="
				Arithmetic and Logic operations: “+” “-” “*” “/”
				Assignment operation: “:=”
				Numbers are expressed by the following regular expression:
					[1-9][0-9]* | 0(c|C)[0-7]+ | 0(x|X)[0-9A-Fa-f]+ | [+-]?[0-9]*”.”[0-9]+([eE][-+]?[0-9]+)?
				Identifiers are expressed by the following regular expression: 
					[A-Za-z_][A-Za-z0-9_]*
				Comments are similar to those in C and can span multiple lines.

 * Usage: (1) $ flex rules.flex
 *        (2) $ gcc lex.yy.c -lfl //On Linux
 		  (2) $ gcc lex.yy.c -ll //On mac
 *        (3) $ ./a.out < test.txt
 */


%{
    int num_lines = 0;
%}


//Duda: por que no acepta numeros que empiecen en cero?

//TODO: handle comments
NUMBER [1-9][0-9]*|0(c|C)[0-7]+|0(x|X)[0-9A-Fa-f]+|[+-]?[0-9]*”.”[0-9]+([eE][-+]?[0-9]+)?
IDENTIFIER [A-Za-z_][A-Za-z0-9_]*

%%
int|float|if|then|else|while|read|write {
    printf("Reserved word: %s\n", yytext);
}

\n ++num_lines;

[,;(){} ] printf("Punctuation token: %s\n", yytext);

[<=>]|(>=)|(<=)|(!=) printf("Relational token: %s\n", yytext);

[-+*/]|(\+\+) printf("Arithmetic and Logic operations token: %s\n",yytext);

(:=) printf("Assignment operation token: %s\n",yytext);

{NUMBER} {
    printf("Number: %s\n",yytext);
}

{NUMBER}+"."{NUMBER}* {
    printf("Float: %s\n",yytext);

}

{IDENTIFIER} {
    printf("Identifier: %s\n",yytext);
}

.           printf( "Unrecognized character: %s at line: %d\n", yytext, num_lines+1 );



%%


main()
{
yylex();
}
