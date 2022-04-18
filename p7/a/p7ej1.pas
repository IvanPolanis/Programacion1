
Program p7ej1;

Const dimF = 10;
Procedure CargarV(Var v: vector);

Var i: integer;
Begin
  For i:=1 To dimF Do
    Begin
      write('Introduzca un numero: ');
      readln(v[i]);
    End;
End;

Procedure prom(Var v: vector; Var promedio,neg,pos: real)
Begin
  promedio := 0;
  For i:=1 To dimF Do
    Begin
      promedio := promedio+v[i];
      If (v[i]<0) Then neg := neg +1;
      If (v[i]>0) Then pos := pos+1;
    End;
  prom := prom/dimF;
  neg := neg/dimF;
  pos := pos/dimF;
End;

Function buscarRango(Var v: vector; min,max:integer): integer;

Var i: integer;
Begin
  n := 0;
  For i:= 1 To dimF Do
    If ((v[i]>=min) and (max>=v[i])) Then n := n+1;
  buscarRango:=n;
End;

Begin

End.
