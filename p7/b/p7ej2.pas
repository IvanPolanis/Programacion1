


{Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A del cual se suprimen las componentes que se encuentran entre las posiciones I y J inclusive lascomponentes de dichas posiciones)}

Program p7ej2;

Const dimF = 10;

Type vector = Array[1..dimF] Of integer;

Procedure cargarArray(Var v:vector;Var dimL:integer);

Var n,i: integer;
Begin
  i := 1;
  dimL := 0;
  ReadLn(n);
  While (n<>0) And (i<dimF) Do
    Begin
      v[i] := n;
      readln(n);
      dimL := dimL+1;
      i := i+1;
    End;
End;

Procedure eliminar(Var v:vector; Var dimL:integer; a,b:integer);

Var i,c: Integer;
Begin
  c := b+1;
  For i:=a To b Do
    Begin
      v[i] := v[c];
      c := c+1;
      dimL := dimL-1;
    End;
End;

Procedure imprimir(v:vector; dimL:integer);

Var i: integer;
Begin
  For i:=1 To dimL Do
    write(' ',v[i]);
  WriteLn();
End;

Var a,b,dimL: Integer;
  v: vector;
Begin
  cargarArray(v,dimL);
  imprimir(v,dimL);
  readln(a);
  readln(b);
  eliminar(v,dimL,a,b);
  imprimir(v,dimL);
End.
