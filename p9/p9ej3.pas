

{* Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos
para almacenarlos y escribir un programa que implemente los siguientes módulos:
a) Calcular la longitud de la lista.
b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una
vez, ya que puede haber diferentes lugares turísticos).
c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
d) Agregar al final de la lista creada en c) un nuevo lugar turístico.}

Program p9ej3;

Type 
  places = Record
    name: String;
    country: string;
  End;

  list = ^node;
  node = Record
    place: places;
    next: list;
  End;

Function getLength(l:list): integer;

Var i: integer;
Begin
  i := 0;
  While l<>Nil Do
    Begin
      i := i+1;
      l := l^.next;
    End;
  getLength := i;
End;

Function countCountry(l:list;country:String): integer;

Var counter: integer;
Begin
  counter := 0;
  While l<>Nil Do
    Begin
      If l^.place.country = country Then counter := counter + 1;
      l := l^.next;
    End;
  countCountry := counter;
End;

Procedure addPlace(Var newL:list; data:places);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.place := data;
  newNode^.next := Nil;
  If newL<>Nil Then
    Begin
      actualNode := newL;
      While actualNode^.next<> Nil Do
        Begin
          actualNode := actualNode^.next;
        End;
      actualNode^.next := newNode;
    End
  Else newL := newNode;
End;
Procedure filterCountry(l:list; Var newL:list; country:string);

Begin
  While l<> Nil Do
    Begin
      If l^.place.country = country Then addPlace(newL,l^.place);
      l := l^.next;
    End;
End;
Procedure load(Var l:list);
Procedure loadPlace(Var data:places);
Begin
  writeLn('Introduzca el nombre del lugar: ');
  readln(data.name);
  writeLn('Introduzca el pais del lugar: ');
  readln(data.country);
End;

Var data: places;
Begin
  loadPlace(data);
  While data.name <> '' Do
    Begin
      addPlace(l,data);
      loadPlace(data);
    End;
End;

procedure printList(l:list);
begin
  while l<>nil do begin 
    writeln(l^.place.name);
    writeln(l^.place.country);
    l:=l^.next;
  end;
end;

var l,newL:list;

Begin
    load(l);
    writeln(getLength(l));
    writeln(countCountry(l,'mexico'));
    filterCountry(l,newL,'mexico');
    printList(newL);

End.
