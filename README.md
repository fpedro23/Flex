# Flex
##Lexical Analysis
##Description: 
For this assignment you will construct a lexical analyzer (scanner) for tiny C, a subset of the C language. The language 				recognizes the following tokens:

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

## Usage:
1. `$flex rules.flex`
2. Compile
  * `$ gcc lex.yy.c -lfl //On Linux`
  * `$ gcc lex.yy.c -ll //On mac`
3. `$ ./a.out < test.txt`


