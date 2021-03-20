package com.escod.compiler.flex;
import com.escod.compiler.utils.Tokens;
import static com.escod.compiler.utils.Tokens.*;
%%
%public
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=(String)yytext(); return Comillas;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=(String)yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexeme=(String)yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexeme=(String)yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=(String)yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=(String)yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=(String)yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=(String)yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=(String)yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=(String)yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=(String)yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=(String)yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=(String)yytext(); return Division;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=(String)yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme =(String) yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = (String)yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = (String)yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexeme =(String) yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=(String)yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexeme=(String)yytext(); return Parentesis_c;}

/* Llave de apertura */
( "{" ) {lexeme=(String)yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexeme=(String)yytext(); return Llave_c;}

/* Corchete de apertura */
( "[" ) {lexeme =(String) yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexeme =(String) yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=(String)yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=(String)yytext(); return P_coma;}

/* Identificador */
{L}({L}|{D})* {lexeme=(String)yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=(String)yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
