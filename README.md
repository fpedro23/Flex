# Flex Lexical Analysis
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

# Bison Syntactic Analysis
##Description:
In this assignment you must implement the Tiny C grammar shown below:

        program    -> var_dec stmt_seq
        var_dec     -> var_dec single_dec  | epsilon
        single_dec -> type ID SEMI
        type          -> INTEGER | FLOAT
        stmt_seq  -> stmt_seq stmt  | epsilon
        stmt        -> IF exp THEN stmt  | IF exp THEN stmt ELSE stmt
                    | WHILE exp DO stmt  | variable ASSIGN exp SEMI
                    | READ LPAREN variable RPAREN SEMI
                    | WRITE LPAREN exp RPAREN SEMI
                    | block
                    block       -> LBRACE stmt_seq RBRACE
        exp         -> simple_exp LT simple_exp | simple_exp EQ simple_exp  | simple_exp
        simple_exp  -> simple_exp PLUS term | simple_exp MINUS term | term
        term        -> term TIMES factor  | term DIV factor  | factor
        factor      -> LPAREN exp RPAREN | INT_NUM  | FLOAT_NUM  | variable
        variable    -> ID

 

All symbols in uppercase are tokens that you defined in the previous assignment. However, note that you might need to change some of your definitions to match the tokens in the grammar.

## Usage:
1. `$bison -d grammar.y`
2. Compile
  * `$ gcc grammar.tab.c -o scanner -lfl //On Linux`
  * `$ gcc grammar.tab.c -o scanner -ll //On mac`
3. `$ ./scanner < test1.txt`
4. Or simply run the following command:`$ ./run.sh`
