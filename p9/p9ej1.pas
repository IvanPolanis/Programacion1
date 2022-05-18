{* Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene
en una lista simple. Utilizando la lista creada implementar:
a) un módulo que reciba la lista y devuelva como resultado la cantidad de números con 3 dígitos.
b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La
búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
c) Un módulo que reciba la lista y libere la memoria reservada.}

Program p9ej1;

Type list = ^node;
  node = Record
    numb: integer;
    next: list;
  End;

function numbers(l:list):integer;
var actualNode:list; counter:integer;
begin
  counter:=0;
  actualNode:=l;
  while actualNode<>nil do begin
    if (actualNode^.numb > 99) and (actualNode^.numb < 1000) then counter:= counter + 1;
    actualNode:=actualNode^.next; 
  end;
  numbers:=counter;
end;

function isInList(l:list;n:integer):boolean;
var success:boolean;
begin
    success:=false;
    while not(success) and (l<>nil) do begin
      if l^.numb=n then success:=true;
      l:=l^.next;
    end;
    isInList:=success;
end;


Procedure load(Var l:list);
    Procedure addNode(n:integer; var l:list);

    Var actualNode,newNode: list;
    Begin
    new(newNode);
    newNode^.numb := n;
    newNode^.next := nil;
    If l<>Nil Then
        Begin
        actualNode := l;
        While actualNode^.next <> Nil Do
            actualNode := actualNode^.next;
        actualNode^.next := newNode;
        End
    Else l := newNode;
    End;

    Var n: integer;
    Begin

    readln(n);
    While n<>999 Do
        Begin
        addNode(n,l);
            readln(n);
        End;
    End;

procedure freeMemory(var l:list);
var prevNode:list;
begin
  while l<> nil do begin
    prevNode:=l;
    l:=l^.next;
    dispose(prevNode);
  end;
end;


var l:list;

Begin
l:=nil;
load(l);
WriteLn(numbers(l));
WriteLn(isInList(l,9));
freeMemory(l);
End.
