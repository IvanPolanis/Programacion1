{Construir un programa que lee desde teclado una secuencia de números reales hasta que se
introduzca el 50. Informar los 7 números mayores de la secuencia.
Nota: Implemente la solución sin almacenar TODOS los números leídos}

Program p7ej11;

Const dimF = 7;

Type vector = Array[1..dimF] Of integer;

Procedure insertarNum(Var v:vector;n,pos:integer);
var i:integer;
Begin
  For i:=dimF downto pos Do
    v[i] := v[i-1];
  v[pos]:=n;
End;
Procedure buscarNumero(Var v:vector;n:integer);

Var i: integer;
Begin
  i := 1;
  While (i<=7) And (n<v[i]) Do
    Begin
    writeln('entro al while');
      i := i+1;
    End;
  if (v[i]<>n) then insertarNum(v,n,i);
End;
Procedure cargarNumeros(Var v:vector);

Var i,n: integer;
Begin
n:=0;
  For i:=1 To dimF Do
    v[i] := 0;
  While (n<>50) Do
    Begin
      readln(n);
      buscarNumero(v,n);
    End;
End;

procedure imprimir(var v:vector);
var i:integer;
begin
  for i:=1 to dimF do write(' ',v[i],' ');
end;
var v:vector;
Begin
cargarNumeros(v);

imprimir(v);
End.
