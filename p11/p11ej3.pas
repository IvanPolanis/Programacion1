{Se dispone de una lista con la información de los ingresantes a la Facultad en el año anterior. De
cada ingresante se conoce: apellido, nombre, ciudad de origen, fecha de nacimiento (día, mes, año),
si presentó el título del colegio secundario y el código de la carrera en la que se inscribe (APU, LI,
LS). Con esta información de los ingresantes se pide que recorra la lista una vez para:
a. Informar el apellido de los ingresantes cuya ciudad origen es “Brandsen”.
b. Calcular e informar el año en que más ingresantes nacieron (asumir que los años de
nacimientos de los ingresantes pueden variar entre 1970 y 2000).
c. Informar la carrera con la mayor cantidad de inscriptos.
d. Eliminar de la lista aquellos ingresantes que no presentaron el título.}

Program p11ej3;

Type 
  date = Record
    dia: 1..31;
    dia: 1..12;
    anio: integer;
  End;

  estudiante = Record
    apellido: string;
    nombre: string;
    ciudad: string;
    nacimiento: date;
    titulo: boolean;
    carrera: string[3];
  End;

  list = ^node;

  node = Record
    data: estudiante;
    next: list;
  End;

  vector = Array[1970..2000] Of integer;
  vCarrera = Array[1..3] Of integer;

  ingresantesxCarrera = Record
    ing: integer;
    carrera: integer;
  End;

  ingresantesxAnio = Record
    ing: integer;
    anio: integer;
  End;

Procedure recorrerLista(Var l:list);

Procedure inicializarV(Var v:vector;a,b:integer;);

Var i: integer;
Begin
  For i:=a To b Do
    v[i] := 0;
End;

Procedure llenarV(Var v:vector; anio:integer);
Begin
  v[anio] := v[anio] + 1;
End;

Function calcularM(v:vector): integer;

Var max: ingresantesxAnio;
  i: integer;
Begin
  max.ing := 0;
  max.anio := 0;
  For i:=1970 To 2000 Do
    Begin
      If v[i]> max.ing Then
        Begin
          max.ing := v[i];
          max.anio := i;
        End;
    End;
  calcularM := max.anio;
End;

Procedure llenarC(data:estudiante; Var v:vCarrera);
Begin
  Case data.carrera Of 
    'APU': v[1] := v[1]+1;
    'LI': v[2] := v[2]+1;
    'LS': v[3] := v[3]+1;
  End;
End;

Procedure calcularC(Var v:vCarrera);

Var max,i: integer;
Begin
  max.ing := 0;
  For i:=1 To 3 Do
    If v[i]>max.ing Then
      Begin
        max.ing := v[i];
        max.carrera := i;
        Case max.carrera Of 
          1: writeln('APU');
          2: writeln('LI');
          3: writeln('LS');
        End;
      End;
End;

Procedure informarApellido(data:estudiante);
Begin
  If (data.ciudad = 'Brandsen') Then writeln(data.apellido);
End;

Var actualNode,prevNode,aux: list;
  v: vector;
  vC: vCarrera;
Begin
  actualNode := l;
  inicializarV(v,1970,2000);
  inicializarV(vC,1,3);
  While actualNode<>Nil Do
    Begin
      If actualNode^.data.titulo Then
        Begin
          informarApellido(actualNode^.data);
          llenarV(v,actualNode^.data.anio);
          llenarC(actualNode^.data,vC);
          prevNode := actualNode;
          actualNode := actualNode^.next;
        End
      Else
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
End;
writeln(calcularM(v));
calcularC(vC);
End;

Begin

End.
