



{Construir un programa que implemente y use:
a) un módulo que lea números desde el teclado y los almacene en un vector hasta ingresar el valor
9999 (asuma como máximo 80 números).
b) un módulo que informe los números almacenados en las posiciones impares.
c) un módulo que retorne la posición en que se encuentra el primer elemento par. Si no hay ningún
componente par deberá devolver el valor 0.}

Program p7ej9;

Const dimF = 80;

Type vector = Array[1..80] Of integer;

Procedure cargarVector(Var v:vector; Var dimL:integer);
Begin
  dimL := 0;
  While (dimL<=dimF) And (v[dimL]<>9999) Do
    Begin
      dimL := dimL+1;
      write('Introduzca un numero: ');
      readln(v[dimL]);
    End;
End;

Procedure informarImpar(Var v: vector; dimL:integer);

Var i: integer;
Begin
  i := 1;
  While (i<= dimL) Do
    Begin
      write(' ',v[i],' ');
      i := i+2;
    End;
End;
Function primerPar(Var v: vector; dimL:integer): integer;

Var i: integer;
  found: boolean;
Begin
  i := 1;
  found := false;
  While (i<=dimL) And (Not found) Do
    Begin
      If (v[i] Mod 2 = 0) Then found := true
      Else i := i+1;
    End;
  If (found) Then primerPar := i
  Else primerPar := 0;
End;

Var dimL: integer;
  v: vector;
Begin
  cargarVector(v,dimL);
  informarImpar(v,dimL);
  WriteLn();
  WriteLn('primer par', primerPar(v,dimL));
End.
