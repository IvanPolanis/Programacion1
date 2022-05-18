{* Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro ticket, monto)
correspondientes a sus 6 cajas. Escribir un programa que procese dicha lista y permita:
a) Genere una nueva lista con los tickets con montos menores a $1000.
b) Calcular e informar el monto promedio recaudado por caja.
c) Calcular que cajas que recaudaron más de $12000 con menos de 100 tickets. Luego vuelva a
recorrer la lista para generar una nueva con los tickets pertenecientes a las cajas que cumplan
dicha condición. Recuerde usar un conjunto para mejorar la eficiencia.}

Program p9ej6;

Type 
  tickets = Record
    nro_caja: integer;
    nro_ticket: integer;
    monto: integer;
  End;
  list = ^node;
  node = Record
    ticket: tickets;
    next: list;
  End;
  vector = Array[1..6] Of integer;
  conjunto = set Of 0..6;


Procedure addTicket(Var l:list; data:tickets);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.ticket := data;
  newNode^.next := Nil;
  If l <> Nil Then
    Begin
      actualNode := l;
      While (actualNode^.next <> Nil) Do
        Begin
          actualNode := actualNode^.next;
        End;
      newNode^.next := actualNode^.next;
      actualNode^.next := newNode;
    End
  Else l := newNode;
End;

Procedure load(Var l:list);
Procedure loadTicket(Var data:tickets);
Begin
  write('Introduzca el numero de caja: ');
  readln(data.nro_caja);
  If data.nro_caja <> 0 Then
    Begin
      write('Introduzca el numero de ticket: ');
      readln(data.nro_ticket);
      write('Introduzca el monto: ');
      readln(data.monto);
    End;
End;

Var data: tickets;
Begin
  loadTicket(data);
  While data.nro_caja <> 0 Do
    Begin
      addTicket(l,data);
      loadTicket(data);
    End;
End;

Procedure getLess1k(l:list; Var newL:list);
Begin
  newL := Nil;
  While l<>Nil Do
    Begin
      If (l^.ticket.monto < 1000) Then addTicket(newL,l^.ticket);
      l := l^.next;
    End;
End;


Procedure createNewList(l:list; Var newL:list; v1,v2:vector);

Var i: integer;
  conj: conjunto;
Begin
  conj := [];
  For i:=1 To 6 Do
    If (v1[i] > 12000) And (v2[i]<100) Then conj := conj+[i];
  newL := Nil;
  While l<>Nil Do
    Begin
      writeln(1 In conj);
      If (l^.ticket.nro_caja In conj) Then
        Begin
          addTicket(newL,l^.ticket);
        End;
      l := l^.next;
    End;
End;


Procedure print(v1,v2:vector);

Var i: integer;
Begin
  For i:=1 To 6 Do
    Begin
      writeln('La caja ',i,' recaudo en promedio: $',v1[i]/v2[i]:2:2);
    End;
End;

Procedure printList(l:list);
Begin
  While l<>Nil Do
    Begin
      writeln(l^.ticket.nro_caja ,' ', l^.ticket.nro_ticket);
      writeln();
      l := l^.next;
    End;
End;

Procedure getProm(l:list);

Var i: integer;
  aux,v: vector;
  newL,auxL: list;
Begin
  For i:=1 To 6 Do
    Begin
      aux[i] := 0;
      v[i] := 0
    End;
  auxL := l;
  While l<>Nil Do
    Begin
      aux[l^.ticket.nro_caja] := aux[l^.ticket.nro_caja]+1;
      v[l^.ticket.nro_caja] := v[l^.ticket.nro_caja]+l^.ticket.monto;
      l := l^.next;
    End;
  createNewList(auxL,newL,v,aux);
  printList(newL);
End;

Var l,newL: list;
Begin
  load(l);
  getLess1k(l,newL);
  printList(newL);
  getProm(l);
End.
