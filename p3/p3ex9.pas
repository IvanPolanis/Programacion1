
{Escriba un programa que lea una secuencia de caracteres terminada en punto, y que a través de
un procedimiento evalúe si cada una de sus palabras tiene la 'p' seguida de la ‘a’. El programa debe
informar cuántas palabras cumplen con esa condición.}

Program p3ex9;
Function isPa(c:char; Var ca:char): integer;
Begin
  If (ca='p') And (c='a') Then
    Begin
      isPa := 1;
    End
  Else
    Begin
      isPa := 0
    End;
  ca := c;
End;

Var c, ca: char;
  count: integer;
Begin
  count := 0;
  ca := ' ';
  write('Introduce un caracter: ');
  readln(c);
  While (c<>'.') Do
    Begin
      count := count + isPa(c,ca);
      write('Introduce un caracter: ');
      readln(c);
    End;
  write(count);
End.
