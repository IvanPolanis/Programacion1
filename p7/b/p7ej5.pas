{*Dada una matriz de números enteros de 50 x 50, realizar un programa para:
a) Imprimir los elementos de las filas pares de la matriz.
b) Imprimir los elementos de las columnas impares de la matriz.
c) Imprimir los elementos de la diagonal principal.}

Program p7ej5;

Const maxL = 5;
  maxC = 5;

Type matriz = Array[1..maxL,1..maxC] Of integer;

Procedure cargarM(Var m:matriz);

Var i,j: integer;
Begin
  For i:=1 To maxL Do
    Begin
      For j:=1 To maxC Do
        Begin
          ReadLn(m[i,j])
        End;
      WriteLn('Fila: ',i);
    End;
End;
Procedure imprimirF(m:matriz);

Var i,j: integer;
Begin
  i := 2;
  WriteLn();
  While (i<=maxL) Do
    Begin
      For j:=1 To maxC Do
        Begin
          write(m[i,j],' ')
        End;
      WriteLn();
      i := i+2;
    End;
End;

Procedure imprimirC(m:matriz);

Var i,j: integer;
Begin
  j := 1;
  WriteLn();
  While (j<=maxL) Do
    Begin
      For i:=1 To maxC Do
        Begin
          write(m[i,j],' ')
        End;
      WriteLn();
      j := j+2;
    End;
End;
Procedure imprimirD(m:matriz);

Var i: Integer;
Begin
  WriteLn();
  For i:=1 To maxC Do
    write (m[i,i], ' ');
End;
Procedure imprimirM(m:matriz);

Var i,j: integer;
Begin
  For i:=1 To maxL Do
    Begin
      For j:=1 To maxC Do
        Begin
          write(m[i,j],' ')
        End;
      WriteLn();
    End;
End;

Var m: matriz;
Begin

  cargarM(m);
  WriteLn();
  WriteLn();
  WriteLn();
  imprimirM(m);
  imprimirF(m);
  WriteLn();
  WriteLn();
  WriteLn();
  imprimirM(m);
  imprimirC(m);
  WriteLn();
  WriteLn();
  WriteLn();
  imprimirM(m);
  imprimirD(m);

End.
