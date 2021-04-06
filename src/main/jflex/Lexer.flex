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

/* Palabra reservada AND */
( and | AND ) {lexeme=(String)yytext(); return AND;}

/* Palabra reservada OR */
( or | OR ) {lexeme=(String)yytext(); return OR;}

/* Parentesis de apertura */
( "(" ) {lexeme=(String)yytext(); return Parentesis_abierto;}

/* Parentesis de cierre */
( ")" ) {lexeme=(String)yytext(); return Parentesis_cerrado;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=(String)yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
