{*Realizar un módulo que reciba dos vectores A y B y un valor I, y que devuelva el vector A en el que
se insertan las componentes del vector B entre las componentes I e I+1 del vector A. Se debe validar
que el parámetro I esté en un rango permitido.}

Program p7ej3;

Const dimF = 5;

Type vector = Array[1..dimF] Of integer;

Procedure cargarV(Var v:vector);

Var n,i: integer;
Begin
  readln(n);
  i := 1;
  While (i<=dimF) And (n <> 0) Do
    Begin
      v[i] := n;
      readln(n);
      i := i + 1;
    End;
End;

Procedure insertar(Var vA,vB: vector; i:integer);

Var k,n: integer;
Begin
  n := i+2;
  If (i >0) And (n <=dimF) Then
    Begin
      For k:= dimF downto n Do
        Begin
          vA[k] := vA[k-2];
        End;
    End;
  If (i>0) And (i < dimF) Then
    Begin
      vA[i] := vB[i];
      vA[i+1] := vB[i+1];
    End
  Else WriteLn('No se pudo insertar correctamente.');
End;
Procedure imprimir(v:vector);

Var i: integer;
Begin
  For i:=1 To dimF Do
    write(' ',v[i]);
  WriteLn();
End;

Var v1,v2: vector;
  i: integer;
Begin
  cargarV(v1);
  cargarV(v2);
  readln(i);
  imprimir(v1);
  imprimir(v2);
  insertar(v1,v2,i);
  imprimir(v1);
End.
