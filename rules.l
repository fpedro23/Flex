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

 * Usage: (1) $ flex rules.l
 *        (2) $ gcc lex.yy.c -lfl //On Linux
 		  (2) $ gcc lex.yy.c -ll //On mac
 *        (3) $ ./a.out < test.txt
 */


%{
    int num_lines = 0;
    int comment_caller;
%}



NUMBER [0-9][0-9]*|0(c|C)[0-7]+|0(x|X)[0-9A-Fa-f]+|[+-]?[0-9]*”.”[0-9]+([eE][-+]?[0-9]+)?
IDENTIFIER [A-Za-z_][A-Za-z0-9_]*

%x comment foo
%%

    /*Return token based on the input string*/

"int"   { return INTEGER;  }
"float" { return FLOAT;    }
"if"    { return IF;       }
"then"  { return THEN;     }
"else"  { return ELSE;     }
"while" { return WHILE;    }
"read"  { return READ;     }
"write" { return WRITE;    }
"do"    { return DO;       }


"," { return COMMA;   }
";" { return SEMI;    }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LBRACE;  }
"}" { return RBRACE;  }


"<"     { return LT;  }
"="     { return EQ;  }
">"     { return GT;  }
">="    { return GTE; }
"<="    { return LTE; }
"!="    { return NEQ; }

"-" { return MINUS; }
"+" { return PLUS;  }
"*" { return TIMES; }
"/" { return DIV;   }
":=" { return ASSIGN;}

\n ++num_lines;

{NUMBER} {
    return INT_NUM;
}

{NUMBER}+"."{NUMBER}* {
    return FLOAT_NUM;

}

{IDENTIFIER} {
    return ID;
}


"//" {while(input() != '\n') //Handle single line comments

    ;
    num_lines++;}



"/*"   				 { //Handle multiline Comments

    
                      comment_caller = INITIAL;
                      BEGIN(comment);
                      }
     
<comment>[^*\n]*        /* eat anything that's not a '*' */
<comment>"*"+[^*/\n]*   /* eat up '*'s not followed by '/'s */
<comment>\n             ++num_lines;
<comment>"*"+"/"        BEGIN(comment_caller); 

[ \t] {} //Ignore Blank spaces

. {printf( "Unrecognized character: %s at line: %d\n", yytext, num_lines+1 );}


%%

