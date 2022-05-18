
{Escribir un programa que lea una secuencia de números enteros y genere una lista. La lectura finaliza
cuando se lee el número 0. Una vez generada la lista, informar:
a) El mayor número leído.
b) La cantidad de números cuya cantidad de dígitos es impar.
c) Los 2 últimos números pares de la lista.}

Program p9ej2;

Type list = ^node;
  node = Record
    numb: integer;
    next: list;
  End;
  vector = array[1..2] Of integer;
Function biggestNumber(l:list): integer;

Var n: integer;
Begin
  n := l^.numb;
  While l<>Nil Do
    Begin
      If n<l^.numb Then n := l^.numb;
      l := l^.next;
    End;
  biggestNumber := n;
End;

Function oddNumbers(l:list): integer;

Var counter: Integer;
Begin
  counter := 0;
  While l<>Nil Do
    Begin
      If (l^.numb Mod 2 = 1) Then counter := counter+1;
      l := l^.next;
    End;
  oddNumbers := counter;
End;


Procedure getBiggerEven(l:list;Var v:vector);
Begin
  v[1] := -9999;
  v[2] := -9999;
  While l<>Nil Do
    Begin
      if (l^.numb mod 2 = 0) then begin
        If l^.numb > v[1] Then
        Begin
          v[2] := v[1];
          v[1] := l^.numb;
        End
      Else If l^.numb > v[2] Then
             Begin
               v[2] := l^.numb;
             End;;
      end;
      l := l^.next;
    End;
End;


Procedure load(Var l:list);
Procedure addNode(n:integer; Var l:list);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.numb := n;
  newNode^.next := Nil;
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

Var l: list; v:vector;
Begin
  load(l);
  writeln(biggestNumber(l));
  WriteLn(oddNumbers(l));
  getBiggerEven(l,v);
  WriteLn(v[1], ' ', v[2]);
End.
