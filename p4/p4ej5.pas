{En un hospital se quiere realizar una estadística sobre los pacientes que han entrado por
guardia el último año. De cada atención se registra paciente atendido, médico que lo atendió
fecha de atención (día, mes y año), hora de llegada (hora y minutos) y hora salida (hora y
minutos). Esta información se lee por teclado y finaliza al ingresar 0 como año de atención.
Se pide:
a) Pensar la representación agrupando la información en estructuras que reflejen
fielmente los datos del problema.
b) Modularice la carga de forma que maximice la reutilización de esta.
c) Calcular e informar el nombre del paciente que más tardó en ser atendido.
d) Informar la cantidad de pacientes que asistieron en agosto.}

Program p4ej5;

Type 
  tiempo = Record
    hora: 0..23;
    minutos: 0..59;
  End;
  f = Record
    dia: 1..31;
    mes: 1..12;
    anio: 0..2100;
  End;
  cadena = string[15];
  paciente = Record
    nombre: cadena;
    medico: cadena;
    fecha: f;
    hora_e: tiempo;
    hora_s: tiempo;
  End;

Procedure cargaF(Var date:f);
Begin
  write('Introduzca el anio: ');
  ReadLn(date.anio);
  If (date.anio <> 0) Then
    Begin
      write('Introduzca el dia: ');
      ReadLn(date.dia);
      write('Introduzca el mes: ');
      ReadLn(date.mes);
    End;
End;

Procedure cargarH(Var hour:tiempo; text:cadena);
Begin
  write('Introduzca la hora de ',text,': ');
  ReadLn(hour.hora);
  write('Introduzca los minutos: ');
  ReadLn(hour.minutos);
End;

Procedure cargarString(Var name:cadena; text:cadena);
Begin
  Write('Introduzca el nombre del ',text,': ');
  ReadLn(name);
End;

Procedure cargarP(Var pacient: paciente);
Begin
  cargaF(pacient.fecha);
  If (pacient.fecha.anio <>0) Then
    Begin
      cargarString(pacient.nombre,'paciente');
      cargarString(pacient.medico,'medico');
      cargarH(pacient.hora_e,'llegada');
      cargarH(pacient.hora_s,'salida');
    End;
End;

Procedure diff(t1,t2:tiempo; Var res:tiempo);
Begin
  If (t1.hora>t2.hora) Then
    Begin
      res.hora := t1.hora-t2.hora;
      If (t2.minutos>t1.minutos) Then
        Begin
          res.minutos := t2.minutos-t1.minutos;
          res.hora := res.hora-1;
        End
      Else res.minutos := t1.minutos-t2.minutos;
    End
  Else
    Begin
      res.hora := t2.hora-t1.hora;
      If (t1.minutos>t2.minutos) Then
        Begin
          res.minutos := t1.minutos-t2.minutos;
          res.hora := res.hora-1;
        End
      Else res.minutos := t2.minutos-t1.minutos;
    End;
End;

Function max(t1,t2:tiempo): Boolean;
Begin
  If (t2.hora>t1.hora) Then
    Begin
      max := true;
    End
  Else If (t1.hora>t2.hora) Then
         Begin
           max := false;
         End
  Else
    Begin
      If (t1.minutos>t2.minutos) Then
        Begin
          max := false
        End
      Else max := true;
    End;
End;

Var p: paciente;
  cant_agosto: integer;
  aux,tiempo_max: tiempo;
  n_paciente: cadena;
Begin
  cargarP(p);
  tiempo_max.hora := 0;
  tiempo_max.minutos := 0;
  cant_agosto := 0;
  While (p.fecha.anio<>0) Do
    Begin
      If (p.fecha.mes = 8) Then cant_agosto := cant_agosto + 1;
      diff(p.hora_e,p.hora_s,aux);
      If (max(tiempo_max,aux)) Then
        Begin
          tiempo_max := aux;
          n_paciente := p.nombre;
        End;
      cargarP(p);
    End;

  writeln('Pacientes en agosto: ',cant_agosto);
  writeln('Paciente: ',n_paciente,' estuvo ',tiempo_max.hora,':',tiempo_max.
          minutos, 'hs.');
End.