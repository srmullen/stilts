/* lexical grammer */

%lex
%%

\s+                  /* skip whitespace */
[0-9]+("."[0-9]+)?\b return 'NUMBER'
"*"                  return '*'
"/"                  return '/'
"+"                  return '+'
"-"                  return '-'
"("                  return '('
")"                  return ')'
<<EOF>>              return 'EOF'
.                    return 'INVALID'

/lex

/* operator associations and precedence */

%left '+' '-'
%left '*' '/'
%left UMINUS

%start expressions

%% /* language grammer */

expressions
  : e EOF
    { typeof console !== 'undefined' ? console.log($1) : print($1);
      return $1 }
  ;

e
  : e '+' e
    { $$ = $1 + $3; }
  | e '-' e
    { $$ = $1 - $3; }
  | e '*' e
    { $$ = $1 * $3; }
  | e '/' e
    { $$ = $1 / $3; }
  | '-' e %prec UMINUS
    { $$ = -$2; }
  | '(' e ')'
    { $$ = $2; }
  | NUMBER
    { $$ = Number(yytext); }
;