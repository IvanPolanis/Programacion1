
{Escriba un módulo que reciba un carácter que debe ser un operador matemático ('*', '+', '-', '/') y
dos números enteros, y devuelva el resultado de realizar la operación matemática entre los dos
números recibidos. En caso de que el carácter no sea uno de los operadores matemáticos
indicados, el módulo debe devolver el valor -1.}

Program p3ex8;
Function res(c:char;a,b:integer): integer;
Begin
  Case c Of 
    '+' : res := a + b;
    '-' : res := a - b;
    '*' : res := a * b;
    '/' : res := a Div b;
    Else res := -1;
  End;
End;

Var c: char;
  a,b: integer;
Begin
  write('Introduce el operando(+,-,*,/): ');
  readln(c);
  write('Introduzca un numero: ');
  read(a);
  write('Introduzca un numero: ');
  read(b);
  write('El resultado de la operacion ', a, c,b,' es: ', res(c,a,b));
End.
