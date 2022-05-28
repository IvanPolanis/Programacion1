
Program parcial;

Type 
  date = Record
    dia: integer;
    mes: integer;
    anio: integer;
    hora: 0..23;
  End;

  email = Record
    identificador: integer;
    correo: Array[1..60] Of char;
    fecha: date;
    spam: 0..99;
  End;

  list = ^node;
  node = Record
    data: email;
    next: list;
  End;

  identifier = Record
    identificador: integer;
    spam: 0..99;
  End;
  conj = set Of char;
  vector = Arrar[1..10] Of list;

Procedure recorrerLista(Var l:list);
Procedure getMinimo(data:email;Var min1,min2:identifier);
Begin
  If (data.identifier.spam < min1.spam) Then
    Begin
      min2.spam := min1.spam;
      min2.id := min1.id;
      min1.spam := data.identifier.spam;
      min1.id := data.identifier.id;
    End
  Else If (data.identifier.spam < min2.spam) Then
         Begin
           min2.spam := data.identifier.spam;
           min2.id := data.identifier.id;
         End;
End;

Function comprobarFecha(data:date): boolean;
Begin
  comprobarFecha := ((data.dia = 30) And (data.mes = 6) And (data.anio=2021));
End;

Function validarMail(data:email): boolean;

Var exito: boolean;
  i,cont: integer;
  mayus,minus,digitos: conj;
Begin
  conj := ['0'..'9'];
  i := 1;
  cont := 0;
  While data.correo[i]<>'@' Do
    Begin
      i := i+1
           cont:=cont+1;
    End;
  If Not(cont>=3) Then
    exito := false;
  cont := 0;
  i := i+1;
  While exito And data.correo[i]<>'.' Do
    Begin
      i := i+1:
           cont:=cont+1;
    End;
  If Not(cont>=3) Then
    exito := false;
  cont := 0;
  i := i+1;
  While exito And data.correo[i]<>' ' And cont<=3 Do
    Begin
      If (data.correo[i] In conj) Then exito := false
      Else If cont>3 Then exito := false;
      i := i+1;
      cont := cont+1;
    End;
  If Not((cont=3) Or (cont=2)) Then
    exito := false;
  If exito And Not((2<=i-aux) And (i-aux<=3)) Then exito := false;
  validarMail := exito;
End;

Procedure generarListas(Var v:vector);

Var i: integer;
Begin
  For i:=1 To 10 Do
    v[i] := Nil;
End;

Procedure insertarListas(Var v:vector; data:email);

Var newNode,prevNode,actualNode: list;
  aux: integer;
Begin
  new(newNode);
  newNode^.data := data;
  newNode^.next := Nil;
  aux := (data.identifier.spam div 10) + 1;
  actualNode := v[aux];
  prevNode := actualNode;
  If (v[aux] <> Nil) Then
    While (actualNode^.next <> Nil ) And (actualNode^.data.identifier.spam < data.identifier.spam) Do
      Begin
        prevNode := actualNode;
        actualNode := actualNode^.next;
      End;
  If actualNode=prevNode Then v[aux] := newNode
  Else
    Begin
      prevNode^.next := newNode;
      newNode^.next := actualNode;
    End;
End;

Var min1,min2: identifier;
  aux,prevNode,actualNode: list;
Begin
  min2.spam := 0;
  min2.id := 0;
  min1.spam := 0;
  min1.id := 0;
  prevNode := l;
  actualNode := l;
  generarListas(v);
  While actualNode <> Nil Do
    Begin

      If Not(validarMail(actualNode^.data)) Then
        Begin
          If (prevNode=actualNode) Then
            Begin
              aux := l;
              l := l^.next;
              prevNode := l;
              actualNode := l;
              dispose(aux);
            End
          Else
            Begin
              prevNode^.next := actualNode^.next;
              aux := actualNode;
              actualNode := actualNode^.next;
              dispose(aux);
            End;
        End
      Else
        Begin
          If comprobarFecha(actualNode^.data.fecha) Then
            getMinimo(actualNode^.data,min1,min2);
          insertarListas(v,actualNode^.data)
          prevNode := actualNode;
          actualNode := actualNode^.next;
        End;
    End;

End;


Begin
End;
