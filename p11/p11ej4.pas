





{Una La Una empresa de la ciudad de La Plata, que realiza entregas de paquetes dentro del casco
urbano, está interesada en procesar la información de sus paquetes. De cada paquete se conoce la
fecha de envío, si pudo ser entregado al destinatario y la dirección que está compuesta por los
campos: calle (de 1 a 122), número, piso y departamento.
Se dispone de una lista con los envíos del pasado año. Se requiere procesar la lista recorriéndola
una sola vez para:
a. Informar la cantidad de envíos realizados para cada calle.
b. Informar el nombre del mes con mayor cantidad de paquetes enviados.
c. Eliminar de la lista de envíos, aquellos que no fueron entregados al destinatario.
d. Generar 10 nuevas listas con los envíos de las calles 11 a la 20. Cada lista debe estar ordenada
por el número de la dirección.}

Program p11ej4;

Type 
  address = Record
    calle: 1..122;
    numero: integer;
    piso: integer;
    departamento: integer;
  End;

  date = Record
    dia: 1..31;
    mes: 1..12;
    anio: integer;
  End;

  envio = Record
    fecha: date;
    entregado: boolean;
    direccion: address;
  End;

  maxM = Record
    pedidos: integer;
    mes: 1..12;
  End;

  list: ^node;

  node = Record
    data: envio;
    next: list;
  End;

  vC = Array[1..122] Of integer;
  vM = Array[1..12] Of integer;
  vL = Array[11.20] Of list;

Procedure inicializarL(Var v:vL);

Var i: integer;
Begin
  For i:=11 To 20 Do
    v[i] := Nil;
End;

Procedure insertarL(Var l:list; data:envio);

Var actualNode,prevNode,newNode: list;
Begin
  new(newNode);
  newNode^.data := data;
  newNode^.next := Nil;
  actualNode := l;
  While actualNode<> Nil And actualNode^.data.direccion.numero > data.direccion.numero Do
    Begin
      prevNode := actualNode;
      actualNode := actualNode^.next;
    End;
  If actualNode = l Then l := newNode
  Else
    Begin
      prevNode^.next := newNode;
      newNode^.next := actualNode;
    End;
End;
End;

Procedure inicializarV(Var v:vC);

Var i: integer;
Begin
  For i:=1 To 122 Do
    v[i] := 0;
End;

Procedure llenarVC(Var v:vC;i:integer);
Begin
  v[i] := v[i]+1;
End;

Procedure informarExC(v:vc);

Var i: integer;
Begin
  For i:=1 To 122 Do
    writeln(v[i]);
End;

Procedure inicializarVM(Var v:vM);

Var i: integer;
Begin
  For i:=1 To 12 Do
    v[i] := 0;
End;

Procedure llenarVM(Var v:vM;i:integer);
Begin
  v[i] := v[i]+1;
End;

Procedure calcularM(v:vm);
Procedure informarM(mes:integer);
Begin
  Case mes Of 
    1: writeln('Enero');
    2: writeln('Febrero');
    3: writeln('Marzo');
    4: writeln('Abril');
    5: writeln('Mayo');
    6: writeln('Junio');
    7: writeln('Julio');
    8: writeln('Agosto');
    9: writeln('Septiembre');
    10: writeln('Octubre');
    11: writeln('Noviembre');
    12: writeln('Diciembre');
  End;
End;

Var i: integer;
  m: maxM;
Begin
  maxM.pedidos := 0;
  For i:=1 To 12 Do
    If v[i]>maxM.pedidos Then
      Begin
        maxM.pedidos := v[i];
        maxM.mes := i;
      End;
  informarM(maxM.mes);
End;

Procedure limpiarMemoria(Var l:list);

Var aux: list;
Begin
  While l<>Nil Do
    Begin
      aux := l;
      l := l^.next;
      dispose(aux);
    End;
End;

Procedure recorrerLista(Var l:list, Var vListas:vL);
Procedure eliminar(Var l,prevNode,actualNode:list);

Var aux: list;
Begin
  If actualNode=l Then
    Begin
      aux := l;
      l := l^.next;
      dispose(aux);
      actualNode := l;
    End
  Else
    Begin
      prevNode^.next := actualNode^.next;
      aux := actualNode;
      actualNode := actualNode^.next;
      dispose(aux);
    End;
End;

Var actualNode,prevNode,aux: list;
  v := vC;
  vmes: vM;
Begin
  actualNode := l;
  inicializarV(v);
  inicializarVM(vmes);
  inicializarL(vListas);
  While (actualNode<>Nil) Do
    Begin
      If actualNode^.data.entregado Then
        Begin
          llenarVC(v,actualNode^.data.direccion.calle);
          llenarVM(v,actualNode^.data.fecha.mes);
          If (actualNode^.data.direccion.calle > 10) And (actualNode^.data.direccion.calle < 21) Then
            insertarL(vListas[actualNode^.data.direccion.calle],actualNode^.data);
          prevNode := actualNode;
          actualNode := actualNode^.next;
        End
      Else eliminar(l,prevNode,actualNode);
    End;
  calcularM(vmes);
  informarExC(v);
End;

Var l: list;
  vListas: vL;
  i: integer;
  
Begin
  l := Nil;
  carga(l); {se dispone}
  recorrerLista(l,vListas);
  limpiarMemoria(l);
  For i:=11 To 20 Do
    limpiarMemoria(vListas[i]);
End.
