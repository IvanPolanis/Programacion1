{Se dispone de un módulo que carga un vector con a lo sumo 2000 nombres de personas, ordenadas
de forma ascendente. Realice un programa que implemente módulos que reciban dicho vector y
permitan:
a) Buscar y devolver la posición en la que se encuentra una persona cuyo nombre se recibe como
parámetro.
Tener en cuenta que dicha persona puede no existir.
b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres
repetidos.
d) Modifique c) considerando ahora que puede haber repetidos.}

Program p7ej10;

Const dimF = 10;

Type 
  cadena = String[20];
  vector = Array[1..dimF] Of cadena;

Procedure CargarVector(Var v:vector; Var dimL: integer);
Begin
  dimL := 1;
  write('Introduzca un nombre: ');
  readln(v[dimL]);
  While (dimL<=dimF) And (v[dimL]<>'zzz') Do
    Begin
      dimL := dimL+1;
      write('Introduzca un nombre: ');
      readln(v[dimL]);
    End;
End;

Procedure BusquedaBin ( Var v: Vector;Var j:integer;Var existe: Boolean;dimL: integer; x : cadena);

Var pri, ult, medio : integer ;
Begin
  pri := 1 ;
  ult := dimL;
  medio := (pri + ult ) Div 2 ;
  While ( pri<=ult ) And ( x <> v[medio]) Do
    Begin
      If ( x<v[medio] ) Then ult := medio-1
      Else pri := medio+1 ;
      medio := ( pri + ult ) Div 2 ;
    End ;
  If pri <= ult Then existe := true
  Else existe := false ;
  j := medio;
End ;

Procedure insertar(Var v:vector; dimL:integer);

Var i,pos: integer;
  existe: Boolean;
  nombre: cadena;
Begin
  readln(nombre);
  If (dimL<>dimF) Then
    Begin
      BusquedaBin(v,pos,existe,dimL,nombre);
      For i:=dimL Downto pos Do
        v[i + 1] := v[i];
      v[pos] := nombre;
    End
  Else WriteLn('no hay lugar flaco');
End;

Procedure eliminar(Var v:vector;Var dimL:integer);

Var i,pos: integer;nombre:cadena;
  existe: boolean;
Begin
  readln(nombre);
  BusquedaBin(v,pos,existe,dimL,nombre);
  If (existe) Then
    Begin
      For i:=pos+1 To dimL Do
        v[i-1] := v[i];
      dimL := dimL-1;
    End;
End;

Procedure imprimir(Var v:vector; dimL:Integer);

Var i: Integer;
Begin
  For i:=1 To dimL Do
    write(' ',v[i],' ')
End;

Var v: vector;
  dimL: integer;

Begin
  CargarVector(v,dimL);
  eliminar(v,dimL);
  imprimir(v,dimL);
End.
