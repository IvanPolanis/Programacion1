{Realizar un programa que procese la información de los alumnos que cursan el 2do año de la
carrera Ingeniería en Computación. Para ello se ingresa desde teclado la información de cada
alumno, hasta leer el número de alumno 756, el cual debe procesarse. De cada alumno se conoce
el número de alumno, y la cantidad de materias aprobadas. Para cada materia aprobada se ingresa
la nota obtenida. Informar la máxima nota obtenida por cada alumno y el número de alumno de quien
haya obtenido el máximo promedio en la carrera.}
program ex8p1;
var
    alumno:integer;
    maxAlum:integer;
    materia:integer;
    nota:real;
    max:real;
    promedio:real;
    maxPromedio:real;
    i:integer;
begin
    maxPromedio:=0;
    alumno:= 0;
    while(alumno <> 756) do begin
        promedio:=0;
        max:=0;
        write('Ingrese el numero de alumno: ');
        read(alumno);
        write('Ingrese la cantidad de materias aprobadas: ');
        read(materia);
        for i:=1 to materia do begin
          write('Ingrese la nota de la materia ',i,' : ');
          read(nota);
          if(nota>max) then max:=nota;
          promedio:= promedio + nota;
        end;
        promedio:= promedio/materia;
        writeln('La mayor nota del alumno es: ', max:2:2);
        if(promedio > maxPromedio) then begin
          maxPromedio:= promedio;
          maxAlum:= alumno;
        end;

    end;
        write('El alumno con mayor promedio es: ', maxAlum, '. Y su promedio es: ', maxPromedio:2:2);
end.