package com.escod.compiler.flex;
import com.escod.compiler.cup.sym;import java_cup.runtime.Symbol;
%%
%public
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}


/* Palabra reservada and */
( and ) {return new Symbol(sym.If, (int) yychar, yyline, yytext());}

/* Palabra reservada or */
( or ) {return new Symbol(sym.Else, (int) yychar, yyline, yytext());}

/* Palabra reservada not */
( not ) {return new Symbol(sym.Do, (int) yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_abierto, (int) yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_cerrado, (int) yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, (int) yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, (int) yychar, yyline, yytext());}
