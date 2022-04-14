
{Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo
de caracteres con un máximo de 150 caracteres:
a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la
posición del último carácter.
b) Implementar una versión del módulo que asuma que el último carácter es punto.
Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud
máxima.}

Program p7ej8;

Const dimF = 150;

Type vector = Array[1..150] Of char;

Procedure cargarVector(Var v: vector; Var dimL:integer);
Begin
  dimL := 1;
  While (dimL<=dimF) And (v[dimL]<>'.') Do
    Begin
      Write('Intrduzca un caracter: ');
      readln(v[dimL]);
    End;
End;
Begin

End.
