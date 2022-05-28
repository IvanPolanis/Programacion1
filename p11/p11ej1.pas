{Un banco dispone de una lista en donde almacena la información de aquellos clientes que vienen a
pagar impuestos. De cada cliente conoce: DNI, Nombre, Apellido, código de impuesto a pagar (1 a
9) y el monto a pagar. Se pide:
a. Realizar la atención de los clientes hasta que se recaude al menos 100.000 pesos o hasta que
se terminen los clientes.
b. Al finalizar la atención informar el código de impuesto que más veces se pagó por los clientes
que fueron atendidos.
c. Al finalizar la atención informar, en caso de que hayan quedado, la cantidad de clientes sin
atender.
 Nota: Asumir que cada cliente paga un solo impuesto.}

Program p11ej1;

Type 
  cliente = Record
    dni: integer;
    nombre: string;
    apellido: string;
    codigo: integer;
    monto: integer;
  End;
  list = ^node;
  node = Record
    data: client;
    next: list;
  End;
  vector = Array[1..9] Of integer;
Procedure cargar(Var l:list);
Procedure cargarCliente(Var dato:cliente);
Begin
  readln(dato.dni);
  If dni<>0 Then
    Begin
      readln(dato.nombre);
      readln(dato.apellido);
      readln(dato.codigo);
    End;
End;

Procedure insertarCliente(Var l:list;dato:cliente);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.data := dato;
  newNode^.next := Nil;
  actualNode := l;
  If l<> Nil Then
    Begin
      While actualNode^.next <> Nil Do
        actualNode := actualNode^.next;
    End;
  If actualNode=l Then l := newNode
  Else actualNode^.next := newNode;
End;

Var dato: cliente;
Begin
  cargarCliente(dato);
  While dato.dni <> 0 Do
    Begin
      insertarCliente(l,dato);
      cargarCliente(dato);
    End;
End;


Procedure atencionCliente(l:list;impuestos:vector);

procedure procesarImpuesto(var impuestos:vector);
begin
  min:=0;
  for n:=1 to 9 do begin
    if impuestos[n]>min then min:=impuestos[n];
  end;
  for n:=1 to 9 do begin
    if impuestos[n]=min then writeLn('El impuesto que más se pago fue el ',n);
  end;
end;



Var acum,cont_cliente: integer;
Begin
  acum := 0;
  cont_cliente := 0;
  While l<>Nil And acum<=100000 Do
    Begin
      acum := acum + l^.data.monto;
      impuestos[n]:= impuestos[n] + 1;
      l := l^.next;
    End;
  While l<>Nil Do
    Begin
      cont_cliente := cont_cliente + 1:
      l:=l^.next;
    End;
  informarImpuesto(impuestos);
  If (cont_cliente > 0) Then writeLn('Quedaron ', cont_cliente, ' clientes sin atender.')
  Else writeLn('Se atendieron todos los clientes de la lista');
End;

Begin

End;
