{Realizar un programa que lea de teclado un vector de 600 caracteres. Finalizada la carga informar:
a) La cantidad y porcentaje de consonantes sobre el total de caracteres alfabéticos.
b) La cantidad y porcentaje de caracteres que son dígitos, letras mayúsculas, letras minúsculas
sobre el total de caracteres ingresados.}

Program p7ej3;

Const dimF = 15;

Type vector = Array[1..dimF] Of char;
  letras = set Of char;
Procedure cargarCaracteres(Var v:vector);

Var i: integer;
Begin
  For i:=1 To dimF Do
    Begin
      Write('Introduzca un caracter: ');
      readln(v[i]);
    End;
End;

Procedure contCons(Var v:vector; Var cons,cont_num, cont_mayus,cont_minus:
                   integer; Var porcentaje_cons,porcentaje_num,porcentaje_mayus,
                   porcentaje_minus:
                   real);

Var i,cont: integer;
  consonantes, alfabeto, numeros,mayus,minus: letras;

Begin
  cons := 0;
  cont := 0;
  cont_mayus := 0;
  cont_num := 0;
  cont_minus := 0;
  mayus := ['A'..'Z'];
  minus := ['a'..'z'];
  alfabeto := minus + mayus ;
  numeros := ['0'..'9'];
  consonantes := alfabeto - ['a','e','i','o','u','A','E','I','O','U'];
  For i:=1 To dimF Do
    Begin
      If (v[I] In alfabeto) Then
        Begin
          If (v[I] In mayus) Then cont_mayus := cont_mayus+1
          Else cont_minus := cont_minus+1;
          cont := cont+1;
          If (v[i] In consonantes) Then cons := cons + 1;
        End
      Else If (v[i] In numeros) Then
             Begin
               cont_num := cont_num+1;
             End;
    End;
  porcentaje_cons := cons / cont * 100;
  porcentaje_num := cont_num/dimF *100;
  porcentaje_mayus := cont_mayus/dimF *100;
  porcentaje_minus := cont_minus/dimF *100;
End;

Var v: vector;
  cons,cont_num,cont_mayus,cont_minus: integer;
  porcentaje_cons,porcentaje_num,porcentaje_mayus,
  porcentaje_minus: real;
Begin

  cargarCaracteres(v);
  contCons(v,cons,cont_num,cont_mayus,cont_minus,porcentaje_cons,porcentaje_num,
           porcentaje_mayus,
           porcentaje_minus);
  WriteLn('El numero de consonantes ingresado es: ', cons,'. El porcentaje de consonantes sobre caracteres alfabeticos es: ',porcentaje_cons:2:2,'%');
  WriteLn('El numero de numeros ingresado es: ', cont_num,'. El porcentaje de numeros en el vector es: ',porcentaje_num:2:2,'%');
  WriteLn('El numero de mayusculas ingresado es: ', cont_mayus,'. El porcentaje de mayusculas en el vector es: ',porcentaje_mayus:2:2,'%');
  WriteLn('El numero de minusculas ingresado es: ', cons,'. El porcentaje de minusculas en el vector es: ',porcentaje_minus:2:2,'%');
End.
