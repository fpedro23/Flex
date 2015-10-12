%{
    #include <string.h>
    #include <stdio.h>
    
    // Declare error handling function
    void yyerror(char *string);
%}

// Token declaration
%token ID
%token SEMI
%token INTEGER
%token FLOAT
%token IF
%token THEN
%token ELSE
%token WHILE
%token DO
%token ASSIGN
%token READ
%token LPAREN
%token RPAREN
%token WRITE
%token LBRACE
%token RBRACE
%token LT
%token GT
%token EQ
%token PLUS
%token MINUS
%token TIMES
%token DIV
%token INT_NUM
%token FLOAT_NUM
%token COMMA
%token GTE
%token LTE
%token NEQ
%%
// Grammar rules
program : var_dec stmt_seq { printf("No errors\n"); }
var_dec : var_dec single_dec |
single_dec : type ID SEMI
type : INTEGER | FLOAT
stmt_seq : stmt_seq stmt |
stmt : IF exp THEN stmt |
IF exp THEN stmt ELSE stmt |
WHILE exp DO stmt |
variable ASSIGN exp SEMI |
READ LPAREN variable RPAREN SEMI |
WRITE LPAREN exp RPAREN SEMI |
block
block : LBRACE stmt_seq RBRACE
exp : simple_exp LT simple_exp | simple_exp EQ simple_exp | simple_exp
simple_exp : simple_exp PLUS term | simple_exp MINUS term | term
term : term TIMES factor | term DIV factor | factor
factor : LPAREN exp RPAREN | INT_NUM | FLOAT_NUM | variable
variable : ID
%%

#include "lex.yy.c"

// Implement error handling function
void yyerror(char *string) {
    printf("%s at line %d\n", string, num_lines+1);
}

int main() {
    yyparse();
}