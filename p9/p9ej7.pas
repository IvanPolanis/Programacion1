


{* Un banco dispone de una lista con la información de pago de sus jubilados (Documento, apellido,
nombre y monto a pagar). Debido a que la cantidad de jubilados para cobrar es muy grande se
decidió pagarles en 10 días diferentes agrupándolos por el último dígito de su documento. Escribir un
programa que implemente la separación de la lista en 10 listas diferentes conservando el orden
original en cada lista}

Program p9ej7;

Type 
  jubilados = Record
    dni: integer;
    apellido: string;
    nombre: string;
    monto: integer;
  End;

  list = ^node;
  node = Record
    jubilado: jubilados;
    next: list;
  End;
  vector = Array[0..9] Of list;

Procedure añadirJubilado(Var l:list; datos:jubilados);

Var actualNode,newNode: list;
Begin
  new(newNode);
  newNode^.jubilado := datos;
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

Procedure crearListas(l:list;Var vList: vector);
Function descomponerDni(n:integer): integer;
Begin
  descomponerDni := n Mod 10;
End;

Var aux,i: integer;
Begin
  For i:=0 To 9 Do
    vList[i] := Nil;
  While l <> Nil Do
    Begin
      aux := descomponerDni(l^.jubilado.dni);
      añadirJubilado(vList[aux],l^.jubilado);
      l := l^.next;
    End;
End;

Begin

End.
