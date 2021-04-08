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

{espacio} {/*Ignore*/}

( true | false ) {return new Symbol(sym.Op_booleano, (int) yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.Parentesis_a, (int) yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.Parentesis_c, (int) yychar, yyline, yytext());}
( "and" ) {return new Symbol(sym.AND, (int) yychar, yyline, yytext());}
( "or" ) {return new Symbol(sym.OR, (int) yychar, yyline, yytext());}
( "not" ) {return new Symbol(sym.NOT, (int) yychar, yyline, yytext());}


/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, (int) yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, (int) yychar, yyline, yytext());}
