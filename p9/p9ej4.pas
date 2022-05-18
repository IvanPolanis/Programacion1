
{* Dada una lista de aviones (marca, modelo y cantidad de asientos), definir la estructura que permita
almacenarlos y escribir un programa que implemente:
a) Un módulo que reciba una lista de aviones y un avión y lo agregue a la lista. Se sabe que la lista
está ordenada por marca en forma descendente y se pide agregar el avión a la lista de forma que
se mantenga el orden.
b) Un módulo que reciba una lista de aviones y un avión, y elimine el elemento de la lista que
coincida totalmente con el avión recibido. Además, debe retornar si la eliminación se realizó o no.}

Program p9ej4;

type list=^node;
planes= record
name:string;
brand:string;
end;

node = record 
plane:planes;
next:list;
end;

Procedure addPlane(Var l:list; data:planes);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.plane := data;
  newNode^.next := Nil;
  If l <> Nil Then
    Begin
        actualNode:=l;
        while (actualNode^.next <> nil) and (actualNode^.plane.brand > data.brand) do begin
          actualNode:=actualNode^.next;
        end; 
        newNode^.next:=actualNode^.next;
        actualNode^.next:=newNode;
    End
  Else l := newNode;
End;
procedure load(var l:list);
Procedure loadPlane(Var data:planes);
Begin
  writeLn('Introduzca el nombre del avion: ');
  readln(data.name);
  writeLn('Introduzca la marca: ');
  readln(data.brand);
End;

Var data: planes;
Begin
  loadPlane(data);
  While data.name <> '' Do
    Begin
      addPlane(l,data);
      loadPlane(data);
    End;
End;


procedure deletePlane(var l:list;data:planes;success:Boolean);
function compare(listPlane,data:planes):boolean;
begin 
    compare:= (listPlane.name = data.name) and (listPlane.brand = data.brand);
end;
var aux,prevNode:list;
begin
success:=false;
  if l <> nil then
  begin
    aux:=l;
    while (aux^.next <> nil) and not(compare(aux^.plane,data)) do begin  
     prevNode:=aux;
     aux:= aux^.next;
    end;
    if aux <> nil then begin
      if (aux=l) then l:=aux^.next else prevNode^.next:= aux^.next;
      dispose(aux);
      success:=true;
    end;
  end;
end;

procedure printList(l:list);
begin
  while l<>nil do begin 
    writeln(l^.plane.name ,' ', l^.plane.brand);
    writeln();
    l:=l^.next;
  end;
end; 
var l:list; data:planes; success:boolean;
Begin
load(l);
data.name:='a';
data.brand:='a';
deletePlane(l,data,success);
printList(l);
End.
