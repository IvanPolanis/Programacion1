

{*Se desea programar un juego similar a la batalla naval. En dicho juego participan 2 jugadores, cada
uno posee 5 barcos simples (de un casillero) ubicados en un tablero de 10x10. El juego consiste en
tratar de descubrir en qué posiciones están los barcos del contrincante. Los jugadores dan
alternadamente una posición del adversario y éste responde agua o hundido. Informar el nombre del
ganador}

Program p7ej10;

Type matriz = Array[1..10,1..10] Of boolean;

Procedure llenar(Var m:matriz;c:char);

    Function validar(a,b:integer): boolean;
    Begin
    validar := ((a>=1) And (a<=10) And (b>=1) And (b<=10))
    End;
    Procedure default(Var m:matriz);

    Var i,j: integer;
    Begin
    For i:=1 To 10 Do
        For j:=1 To 10 Do
        m[i,j] := false;
    End;

    Var i,a,b: integer;
    Begin
    default(m);
    i := 1;
    While i<=5 Do
        Begin
        Write('Ingrese la fila en la cual quiere que se posicione el barco: ');
        readln(a);
        Write('Ingrese la columna en la cual quiere que se posicione el barco: ');
        readln(b);
        If (validar(a,b)) Then
            Begin
            m[a,b] := true;
            i := i+1;
            End
        Else writeln('Introduzca una posicion valida');
        End;
    End;



Begin

End.
