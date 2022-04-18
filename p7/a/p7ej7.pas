




{Simular el funcionamiento de un conjunto de caracteres de la ‘a’ a la ‘z’ utilizando un arreglo. Defina
un tipo de datos adecuado e implemente módulos que realicen las operaciones de unión y diferencia
de dos conjuntos y una función que permite determinar si una letra pertenece al conjunto.
Nota: realice los chequeos correspondientes en cada módulo para procesar solo letras}

Program p7ej7;

Const dimF = 26;

Type 
  letras = 'a'..'z';
  vector = Array[1..26] Of letras;

Procedure cargarVector(Var v:vector);

Var i: integer;
Begin
  writeln('Cargo array');
  For i:=1 To dimF Do
    readln(v[i])
End;

Procedure unionarray(Var v,v1,v2:vector;Var k:integer);

Var i: char;
  j: integer;
  exito: boolean;
Begin
  k := 1;
  For i:='a' To 'z' Do
    Begin
      exito := false;
      j := 1;
      WriteLn('for de: ',i, '. Y el numero k es igual a: ',k);
      While ((Not exito) And (j<=dimF)) Do
        Begin
          If (v1[j]=i) And (Not exito) Then
            Begin
              v[k] := v1[j];
              exito := true;
              k := k+1;
            End
          Else If (v2[j]=i) And (Not exito) Then
                 Begin
                   v[k] := v2[j];
                   exito := true;
                   k := k+1;
                 End;
          j := j+1;
        End;
    End;
End;

Procedure diferenciaArray(Var v,v1,v2:vector;Var k:integer);

Var i: integer;
  j: integer;
  isInArray: boolean;
Begin
  k := 1;
  For i:=1 To dimF Do
    Begin
      isInArray := false;
      j := 1;
      While ((Not isInArray) And (j<=dimF)) Do
        Begin
          If (v2[j]=v1[i]) Then
            Begin
              isInArray := true;
            End;
          j := j+1;
        End;
      j := 1;
      While (Not isInArray) And (j<=k) Do
        Begin
          If (v1[i]=v[j]) Then isInArray := true;
          j := j+1;
        End;
      If (Not isInArray) Then
        Begin
          v[k] := v1[i];
          k := k+1;
        End;

    End;
End;

Function estaEnArray(Var v: vector; c:char): boolean;

Var exito: boolean;
  i: integer;
Begin
  i := 0;
  exito := false;
  While (Not exito) And (i<=dimF) Do
    Begin
      If (v[i]=c) Then exito := true;
      i := i+1;
    End;

  estaEnArray := exito;
End;

Procedure imprimir(Var v:vector);

Var i: integer;
Begin
  For i:=1 To dimF Do
    write(v[i])
End;

Var v1: vector = ('a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b','a','b');
  v2: vector = ('z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s','z','s');
  v: vector;
  k: integer;
Begin



  diferenciaArray(v,v1,v2,k);
  imprimir(v);

End.
