
{*Realice un programa que lea la información de los empleados administrativos de la Facultad,
sabiendo que a lo sumo existen 800 empleados. De cada empleado se conoce: DNI, Apellido,
Nombre, fecha de nacimiento (día, mes, año) y el número de oficina (existen 20 oficinas que se
numeran de 1 a 20) en donde se desempeña sus tareas dentro de la facultad. La lectura de la
información finaliza cuando llega el empleado con DNI 0 el cual no se procesa. Luego de leer la
información de los empleados, se pide:
a) Informar el Apellido y Nombre de los empleados que trabajan en la oficina número 1.
b) Calcular e informar el total de empleados por oficina.
c) Informar los empleados que cumplen años en un mes que se ingresa desde teclado.}

Program p7ej8;

Const dimF = 4;

Type 
  fecha = Record
    dia: integer;
    mes: integer;
    anio: integer;
  End;
  empleado = Record
    dni: integer;
    apellido: string[20];
    nombre: string[20];
    nacimiento: fecha;
    oficina: integer;
  End;
  vector = Array[1..dimF] Of empleado;
  voficina = Array[1..20] Of integer;

Procedure cargarEmp(Var v:vector;Var dimL:integer);
Procedure cargarFecha(Var f:fecha);
Begin
  Write('Introduzca el dia: ');
  readln(f.dia);
  Write('Introduzca el mes: ');
  readln(f.mes);
  Write('Introduzca el anio: ');
  readln(f.anio);
End;

Var i: Integer;
  dni: integer;
Begin
  i := 0;
  Write('Introduzca el dni(0 para finalizar): ');
  readln(dni);
  While dni <> 0 Do
    Begin
      i := i+1;
      Write('Introduzca el apellido: ');
      ReadLn(v[i].apellido);
      Write('Introduzca el nombre: ');
      ReadLn(v[i].nombre);
      cargarFecha(v[i].nacimiento);
      Write('Introduzca la oficina: ');
      ReadLn(v[i].oficina);
      Write('Introduzca el dni(0 para finalizar): ');
      readln(dni);
    End;
    dimL:=i;
End;

Procedure informar(v:vector;dimL:integer);

Var i: integer;
Begin
  WriteLn('Empleados de la oficina 1: ');
  WriteLn(dimL);
  For i:=1 To dimL Do
    Begin
      If (v[i].oficina = 1) Then
        writeln(v[i].apellido,' ',v[i].nombre);
    End;
End;

Procedure totalEmp(Var v:voficina; v2:vector);

Var i: integer;
Begin
  For i:=1 To 20 Do
    v[i] := 0;
  For i:=1 To dimF Do
    v[v2[i].oficina] := v[v2[i].oficina]+1;
End;
Procedure informarEmpleadon(v:vector; n:integer);

Var i: integer;
Begin
  For i:=1 To dimF Do
    If (v[i].nacimiento.mes = n) Then writeln(v[i].nombre);
End;


Var dimL: integer;
  v: vector;
Begin
  cargarEmp(v,dimL);
  informar(v,dimL)

End.
