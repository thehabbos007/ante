%{

#include <stdlib.h>
#include <stdio.h>
#include <tokens.h>
#include <lexer.h>
void yyerror(const char *msg);

%}

%token EndOfInput
%token Ident

//types
%token I8
%token I16
%token I32
%token I64
%token U8
%token U16
%token U32
%token U64
%token F32
%token F64
%token Bool
%token Void

//operators
%token Operator
%token Eq
%token NotEq
%token AddEq
%token SubEq
%token MulEq
%token DivEq
%token GrtrEq
%token LesrEq
%token Or
%token And
%token StrCat

//literals
%token True
%token False
%token IntLit
%token FltLit
%token StrLit

//keywords
%token Return
%token If
%token Elif
%token Else
%token For
%token ForEach
%token While
%token Do
%token In
%token Continue
%token Break
%token Import
%token Where
%token Enum
%token Struct
%token Class

%token Newline
%token Indent
%token Unindent
%%

module: statement_list
      ;

statement_list: statement_list statement
              | statement
              ;

statement: var_decl
         | '\n'
         ;

type: I8
    | I16
    | I32
    | I64
    | U8
    | U16
    | U32
    | U64
    | F32
    | F64
    | Bool
    | Void
    ;

var_decl: type Ident '=' expr
        | type Ident
        ;

bin_op: '+'
      | '-'
      | '*'
      | '/'
      | '%'
      | '^'
      | '|'
      | '&'
      | '<'
      | '>'
      | Eq
      | NotEq
      | AddEq
      | SubEq
      | MulEq
      | DivEq
      | GrtrEq
      | LesrEq
      | Or
      | And
      | StrCat
      ;

val: Ident

expr: l_expr val
    ;

l_expr: l_expr val bin_op
      | val bin_op
      ;


%%

void yyerror(const char *s){
    fprintf(stderr, "%s\n", s);
    return;
}