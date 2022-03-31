
Program p5ej1;

Type 
  cadena = string[15];
  cadena8 = string[8];
  colectivo = Record
    empresa: cadena;
    n_linea: integer;
    patente: cadena8;
    recaudacion: real;
  End;

Procedure leerColectivo(Var c: colectivo);
Begin
  write('Introduzca el nombre de la empresa:');
  readln(c.empresa);
  If (c.empresa <> 'fin') Then
    Begin
      write('Introduzca el numero de linea: ');
      readln(c.n_linea);
      write('Introduzca la patente: ');
      readln(c.patente);
      write('Introduzca la recaudacion: ');
      readln(c.recaudacion);
    End ;
End;

Var 
  rec_emp, rec_lin: real;
  emp_ant: cadena;
  lin_ant: integer;
  c: colectivo;

Begin
  leerColectivo(c);
  While (c.empresa <> 'fin') Do
    Begin
      rec_emp := 0;
      emp_ant := c.empresa;
      While (c.empresa <> 'fin') And (c.empresa = emp_ant) Do
        Begin
          rec_lin := 0;
          lin_ant := c.n_linea;
          While (c.n_linea = lin_ant) And (c.empresa = emp_ant) Do
            Begin
              rec_lin := rec_lin + c.recaudacion;
              leerColectivo(c);
            End;
          rec_emp := rec_emp + rec_lin;
          writeln('La linea ', lin_ant, ' de la empresa ', emp_ant,
                  ' recaudo: $', rec_lin);
        End;
      writeln('La empresa ', emp_ant, ' recaudo: $', rec_emp);
    End;
End.
