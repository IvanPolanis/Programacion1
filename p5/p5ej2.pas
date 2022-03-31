



{Se desea procesar información acerca de los sueldos de los empleados de una empresa. De
cada empleado se conoce dni y sueldo, código de departamento y número de sucursal en la que
trabaja. La información se ingresa por teclado, ordenada por sucursal y luego por departamento. El
procesamiento termina al ingresar -1 como sucursal. Se pide:
a) Informar el departamento y sucursal de los dos departamentos con mayor monto de sueldos.
b) Para cada sucursal, informar sucursal y monto total de sueldos.}

Program p5ej2;

Type 
  cadena = string[12];
  dep = Record
    departamento: integer;
    n_sucursal: integer;
    monto_s: real;
  End;
  empleado = Record
    dni: cadena;
    sueldo: real;
    empresa: dep;
  End;
Procedure cargarEmpleado(Var e:empleado);
Begin
  write('Ingrese el numero de sucursal: ');
  readln(e.empresa.n_sucursal);
  If (e.empresa.n_sucursal <> -1) Then
    Begin
      write('Ingrese el numero de departamento: ');
      ReadLn(e.empresa.departamento);
      write('Ingrese el DNI: ');
      ReadLn(e.dni);
      write('Ingrese el sueldo: ');
      ReadLn(e.sueldo);
    End;
End;
Procedure analizarMaximos(Var max1,max2: dep; monto:real; dep,suc:integer);
Begin
  If (max1.monto_s < monto) Then
    Begin
      max2.departamento := max1.departamento;
      max2.n_sucursal := max1.n_sucursal;
      max2.monto_s := max1.monto_s;

      max1.departamento := dep;
      max1.n_sucursal := suc;
      max1.monto_s := monto;
    End
  Else If (max2.monto_s < monto) Then
         Begin
           max2.departamento := dep;
           max2.n_sucursal := suc;
           max2.monto_s := monto;
         End;
End;

Procedure imprimirMaximo(max:dep);
Begin
  writeln('El departamento numero ',max.departamento,' de la sucursal nro ', max
          .n_sucursal,' pago: $',max.monto_s:2:2);
End;

Var max1,max2: dep;
  sucursal_anterior, dep_anterior: integer;
  acum,acum_suc: real;
  e: empleado;
Begin
  max1.departamento := 0;
  max1.n_sucursal := 0;
  max1.monto_s := 0;
  max2.departamento := 0;
  max2.n_sucursal := 0;
  max2.monto_s := 0;
  cargarEmpleado(e);
  While (e.empresa.n_sucursal <> -1) Do
    Begin
      acum_suc := 0;
      sucursal_anterior := e.empresa.n_sucursal;
      While (e.empresa.n_sucursal = sucursal_anterior) And (e.empresa.n_sucursal
            <>
            -1) Do
        Begin

          acum := 0;
          dep_anterior := e.empresa.departamento;
          While (e.empresa.departamento = dep_anterior) And (e.empresa.
                n_sucursal = sucursal_anterior) Do
            Begin
              acum := acum + e.sueldo;
              cargarEmpleado(e);
            End;
          acum_suc := acum_suc + acum;
          analizarMaximos(max1,max2,acum,dep_anterior,sucursal_anterior);
        End;
      writeln('La sucursal numero ',sucursal_anterior,' pago: $',acum_suc:2:2);
    End;

  imprimirMaximo(max1);
  imprimirMaximo(max2);
End.
