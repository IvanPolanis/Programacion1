{Defina un tipo de dato que permita almacenar una secuencia de 64 valores binarios e implemente
módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de operaciones lógicas),
junto con dos operandos o uno, según corresponda.}
Program p7ej6;

Const dimF = 4;

Type 
  vector = Array[1..dimF] Of integer;

Procedure cargarArray(Var v: vector);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      write('Introduzca un numero entre 1 y 0: ');
      read(v[i]);
    End;

End;

Procedure f_and(Var v,v1,v2: vector);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If (v1[i] = 1) And (v2[i]=1) Then v[i] := 1
      Else v[i] := 0;
    End;
End;

Procedure f_or(Var v,v1,v2: vector);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If (v1[i] = 1) Or (v2[i]=1) Then v[i] := 1
      Else v[i] := 0;
    End;
End;

Procedure f_not(Var v,v1: vector);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    Begin
      If (v1[i] = 1 ) Then v[i] := 0
      Else v[i] := 1;
    End;
End;

Procedure imprimir(Var v,v1,v2:vector);

Var i: integer;
Begin
  For i:= 1 To dimF Do
    write(' ', v1[i], ' ');
  WriteLn();
  For i:= 1 To dimF Do
    write(' ', v2[i], ' ');
  WriteLn();
  WriteLn('------------');
  For i:= 1 To dimF Do
    write(' ', v[i], ' ');
  WriteLn();
  WriteLn();
End;

Var v,v1,v2: vector;
Begin
  cargarArray(v1);
  cargarArray(v2);
  f_and(v,v1,v2);
  imprimir(v,v1,v2);
  f_or(v,v1,v2);
  imprimir(v,v1,v2);
  f_not(v,v1);
  imprimir(v,v1,v1);
End.
