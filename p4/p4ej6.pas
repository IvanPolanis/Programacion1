


{* La casa central de una cadena de bicicleterías recibe la información de las ventas de cada
mes correspondientes al año 2015, de cada una de sus 7 sucursales. La información recibida
para cada mes por cada sucursal es: cantidad de bicicletas vendidas, monto total facturado,
cantidad de bicicletas defectuosas, y monto total devuelto por bicicletas defectuosas.
Implementar un programa que procese la información previa para informar:
a) Sucursal con menor ganancia.
b) Para cada sucursal el mes en que más vendió.
c) Recaudación promedio en el mes de marzo de todas las sucursales}

Program p4ej6;

Type 
  sucursal = Record
    ventas: integer;
    total: real;
    defectuosas: integer;
    totalD: real;
  End;

Procedure montoD(Var s:sucursal);

Var montoXbici: real;
Begin
  If (t<>0) Then
    Begin
      montoXbici := s.ventas/s.total;
      s.totalD := s.defectuosas*montoXbici;
    End;
End;

Procedure cargarSucursal(Var s: sucursal);

Var i,mes: integer;
Begin
  For i:=1 To 7 Do
    WriteLn('Sucursal Nº',i);
    Begin
      For mes:=1 To 12 Do
        Begin
          write('Ingrese el numero de bicicletas vendidas en el mes ',mes,': ');
          readln(s.ventas);
          write('Ingrese el total facturado en el mes ',mes,': ');
          readln(s.total);
          write('Ingrese el total de bicicletas defectuosas en el mes ',mes,': '
          );
          readln(s.defectuosas);
          montoD(s);
        End;
    End;
End;
Begin
End.
