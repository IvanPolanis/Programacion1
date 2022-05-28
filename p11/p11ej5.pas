










{Se desea modelar un nuevo juego que consiste en un tablero de 15 filas por 15 columnas y que se
juega de a 2 jugadores. Cada casillero del tablero contiene un número del 0 al 10 y un valor que
indica si la celda fue utilizada a lo largo de la partida.
La partida consiste de 10 rondas donde en cada una de las rondas los 2 jugadores eligen una
celda del tablero. Las celdas elegidas en cada ronda se analizan y obtiene un punto el jugador que
eligió la celda que contiene el mayor número. En caso de que ambos jugadores hayan, en una
ronda, elegido una celda que contiene el mismo número ninguno suma puntos. En caso de que
algún jugador seleccione una celda que ya haya sido utilizada a lo largo de la partida, dicho jugador
pierde la ronda y se le suma un punto a su oponente. En caso de que en una ronda ambos
jugadores seleccionen celdas que ya hayan sido utilizadas a lo largo de la partida, ninguno suma
puntos. Se pide:
a. Implemente un módulo que inicialice el tablero de juego. El modulo recibe el tablero y una lista
con los valores que va a tener cada celda del tablero. Cada elemento de la lista almacena: fila,
columna y número para la celda (0 a 10). Además, cada celda se debe marcar como no
utilizada. En caso de que el valor para una celda no venga en la lista, dicha celda se
inicializara con el valor 0 (cero).
b. Implemente un módulo que reciba el tablero y simule el juego. Los valores que cada jugador va
eligiendo son leídos de teclado. Al finalizar el juego, informar los puntos obtenidos por cada
jugador y cuál es el ganador.}

Program p11ej5;

Const dimF = 5;
  rondas = 3;

Type casilla = Record
  numero: integer;
  usado: boolean;
End;
fc = Record
  fila: integer;
  columna: integer;
  numero: integer;
End;
tablero = Array[1..dimF,1..dimF] Of casilla;
list = ^node;
node = Record
  data: fc;
  next: list;
End;

Procedure cargarLista(Var l:list);
Procedure insertar(Var l:list;c:fc);

Var newNode,actualNode: list;
Begin
  new(newNode);
  newNode^.data := c;
  newNode^.next := Nil;
  actualNode := l;
  If l<>Nil Then
    Begin
      While actualNode^.next<>Nil Do
        actualNode := actualNode^.next;
    End;
  If actualNode=l Then l := newNode
  Else
    Begin
      actualNode^.next := newNode;
    End;
End;

Var c: fc;
Begin
  write('fila:');
  readln(c.fila);
  If (c.fila <> 0) Then
    Begin
      write('columna:');
      readln(c.columna);
      write('numero:');
      readln(c.numero);
    End;
  While c.fila <> 0 Do
    Begin
      insertar(l,c);
      write('fila:');
      readln(c.fila);
      If (c.fila <> 0) Then
        Begin
          write('columna:');
          readln(c.columna);
          write('numero:');
          readln(c.numero);
        End;
    End;
End;


Procedure inicializarTablero(Var t:tablero;l:list);

Var i,j: integer;
Begin
  For i:=1 To dimF Do
    For j:=1 To dimF Do
      Begin
        t[i,j].numero := 0;
        t[i,j].usado := false;
      End;
  While l <>Nil Do
    Begin
      t[l^.data.fila,l^.data.columna].numero := l^.data.numero;
      l := l^.next;
    End;
End;

Procedure simularJuego(t:tablero);
Procedure ingresarCasilla(Var c:fc);
Begin
  write('Ingrese la fila: ');
  readln(c.fila);
  write('Ingrese la columna: ');
  readln(c.columna);
End;
Procedure ronda(Var t:tablero; Var p1,p2:integer; c1,c2:fc);
Begin
  If Not(t[c1.fila,c1.columna].usado) And Not(t[c2.fila,c2.columna].usado) Then
    Begin
      If (t[c1.fila,c1.columna].numero) > (t[c2.fila,c2.columna].numero) Then p1 := p1+1
      Else If (t[c1.fila,c1.columna].numero) < (t[c2.fila,c2.columna].numero) Then p2 := p2+1;
      t[c1.fila,c1.columna].usado := true;
      t[c2.fila,c2.columna].usado := true;
    End
  Else If (t[c1.fila,c1.columna].usado) And Not(t[c2.fila,c2.columna].usado) Then
         Begin
           p2 := p2+1;
           t[c2.fila,c2.columna].usado := true;
         End
  Else If (t[c2.fila,c2.columna].usado) And Not(t[c1.fila,c1.columna].usado) Then
         Begin
           p1 := p1+1;
           t[c1.fila,c1.columna].usado := true;
         End;
End;

Var i,p1,p2: integer;
  c1,c2: fc;
Begin
  p1 := 0;
  p2 := 0;
  For i:=1 To rondas Do
    Begin
      writeLn('----------Ronda ',i,'----------');writeLn();
      writeLn('El jugador 1 ingresa casilla');
      ingresarCasilla(c1);
      writeLn('El jugador 2 ingresa casilla');
      ingresarCasilla(c2);
      ronda(t,p1,p2,c1,c2);
    End;
  If (p1>p2) Then
    Begin
      writeln('El jugador 1 gano el juego con ',p1,' puntos.');
      writeln('El jugador 2 perdio el juego con ',p2,' puntos.');
    End
  Else If (p2>p1) Then
         Begin
           writeln('El jugador 2 gano el juego con ',p2,' puntos.');
           writeln('El jugador 1 perdio el juego con ',p1,' puntos.');
         End
  Else writeln('Hubo un empate con ',p1,' puntos cada jugador');
End;


Var l: list;
  t: tablero;
Begin
  cargarLista(l);
  inicializarTablero(t,l);
  simularJuego(t);
End.
