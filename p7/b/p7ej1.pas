{Realizar un módulo que reciba un vector V, un valor N y un número I, y que devuelva el mismo vector
donde se insertó el valor N en la posición I.}
Program p7ej1;

Const dimf = 10;

Type vector = Array[1..dimF] Of integer;

Procedure cargarNumero(Var v:vector;n,i:integer);
Begin
  v[i] := n;
End;

Var n,i: Integer;
  v: vector;

Begin
  readln(n);
  readln(i);
  cargarNumero(v,n,i);
End.
