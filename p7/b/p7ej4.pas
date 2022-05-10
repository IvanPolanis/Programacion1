{Realizar un módulo que reciba un vector V ordenado y un valor N, y retorne verdadero si se encuentra
dicho valor en el vector, o falso en caso contrario.}

Program p7ej4;

Const dimF = 5;

Type vector = Array[1..dimF] Of integer;

Procedure cargarV(Var v:vector; Var dimL:integer);

Var n,i: integer;
Begin
  readln(n);
  i := 1;
  While (i<=dimF) And (n <> 0) Do
    Begin
      v[i] := n;
      If (i<dimF) Then
        Begin
          readln(n);
        End;
      i := i + 1;
      dimL := i;
    End;
End;


Function isInArray(v:vector; dimL,n:integer): boolean;

Var first, half,last: integer;
Begin
  first := 1;
  last := dimL;
  half := ( first + last) Div 2;
  While (first <= half) And (n <> v[half]) Do
    Begin
      If ( n<v[half] ) Then last := half-1
      Else first := half+1;
      half := ( first + last) Div 2;
    End;
  isInArray := (first<=last);
End;

Var dimL: integer;
  v: vector;
Begin
  dimL := 0;
  cargarV(v,dimL);
  write(isInArray(v,dimL,5));
End.
