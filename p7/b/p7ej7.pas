
{*Dada una secuencia de 1000 tuits correspondientes al mes pasado que fueron seleccionados para
calcular algunas estadísticas. Sabiendo que cada tuit contiene información de la fecha y del texto (de
un máximo 140 caracteres) en que fue publicado se pide calcular e informar:
a) La cantidad de hashtags (palabras que empiezan con el carácter ‘#’) y usuarios (palabras que
empiezan con carácter ‘@’).
b) La cantidad de tuits publicados cada día.
c) La cantidad promedio de palabras de un tuit.}

Program p7ej7;

Const dimF = 2;

Type tuit = Record
  fecha: Integer;
  texto: String[140];
End;

vector = Array[1..dimF] Of tuit;
vdias = Array[1..31] Of Integer;

Procedure cargarTuits(Var v:vector);

Var i: Integer;
Begin
  For i:=1 To dimF Do
    Begin
      readLn(v[i].fecha);
      readLn(v[i].texto);
    End;
End;

Function contar(v:vector; c:char): integer;

Var i,j,cont: integer;
  act,ant: char;
Begin
  cont := 0;
  i := 1;
  act := ' ';
  ant := '.';
  For j:=1 To dimF Do
    Begin
      act := ' ';
      ant := '.';
      While Not((act=' ') And (ant=' ')) And (i<=140) Do
        Begin
          ant := act;
          act := v[j].texto[i];
          If (act=c) And (ant=' ') Then cont := cont+1;
          i := i+1;
        End;
    End;
  contar := cont;
End;

Function contarPalabras(v:vector): integer;

Var i,j,cont: integer;
  act,ant: char;
Begin
  cont := 0;
  For j:=1 To dimF Do
    Begin
  i := 1;
      act := ' ';
      ant := '.';
      While Not((act=' ') And (ant=' ')) And (i<=140) Do
        Begin
          ant := act;
          act := v[j].texto[i];
          If Not(act=' ') And (ant=' ') Then cont := cont+1;
          i := i+1;
        End;
    End;
  contarPalabras := cont;
End;

Procedure imprimir(v: vdias);

Var i: integer;
Begin
  writeln();
  For i:=1 To 31 Do
    write(v[i], ' ');
  WriteLn('')
End;

Procedure tuitxdia(Var v2:vdias; v1:vector);

Var i: integer;
Begin
  For i:= 1 To 31 Do
    v2[i] := 0;
  For i:= 1 To dimF Do
    v2[v1[i].fecha] := v2[v1[i].fecha] + 1;
End;

Var v: vector;
  dias: vdias;
Begin
  cargarTuits(v);
  writeln('La cantidad de # es ', contar(v,'#'));
  writeln('La cantidad de @ es ', contar(v,'@'));
  tuitxdia(dias,v);
  imprimir(dias);
  writeln('El promedio de palabras por tuit es: ',contarPalabras(v)/dimF: 2: 2);
End.
