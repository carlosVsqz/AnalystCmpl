package com.escod.compiler.flex;
import com.escod.compiler.cup.sym;
import java_cup.runtime.Symbol;
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

{espacio} {return new Symbol(sym.Espacio, (int) yychar, yyline, yytext());}
( if ) {return new Symbol(sym.If, (int) yychar, yyline, yytext());}
( else ) {return new Symbol(sym.Else, (int) yychar, yyline, yytext());}
( "=" ) {return new Symbol(sym.Igual, (int) yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.Parentesis_abierto, (int) yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.Parentesis_cerrado, (int) yychar, yyline, yytext());}
( ";" ) {return new Symbol(sym.P_coma, (int) yychar, yyline, yytext());}
{L}({L}|{D})* {return new Symbol(sym.Identificador, (int) yychar, yyline, yytext());}
{D}+ {return new Symbol(sym.Numero, (int) yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, (int) yychar, yyline, yytext());}
