






{a) Implemente un módulo que lea una secuencia de caracteres que representan una palabra
(termina con blanco o asterisco), y retorne la cantidad de consonantes y vocales de dicha palabra.
b) Utilizando el módulo implementado en a) realice un programa que procese una secuencia de
caracteres terminada en ‘*’, e informe la cantidad de consonantes y vocales para cada una de sus
palabras y la posición de las palabras (orden en el que fue ingresada) con mayor cantidad de
consonantes y vocales.}

Program p3bex5;

Procedure contar(Var cons, voc: integer);

Type letras = set Of char;

Var car: char;
  conjV, conjC: letras;
Begin
  cons := 0;
  voc := 0;
  conjV := ['a','e','i','o','u'];
  conjC := ['a'..'z'] - conjV;
  readln(car);
  While (car<> '.') And (car<> '*') Do
    Begin
      If (car In conjV) Then
        Begin
          voc := voc + 1;
        End
      Else If (car In conjC) Then begin cons := cons+1; end;
      readln(car);
    End;
End;

Var cons, voc: integer;
Begin
  contar(cons,voc);
  write(cons,' ',voc);
End.
