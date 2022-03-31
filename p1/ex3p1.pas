{Se desea procesar la información de alumnos de diez carreras universitarias. Por cada carrera se
ingresa su código y cantidad de años de duración. Para cada año correspondiente a la duración de
la carrera, se ingresa la cantidad de alumnos que cursa. Realizar un programa que lea por teclado e
informe la carrera que tiene el menor promedio de alumnos de sus años}

program ex3p1;
var
  average, lwrAverage: real;
  totalStudents,carerAmount,years, career,code,careerCode, i,j,students: integer;
begin
  lwrAverage:= 99999;
  for i:=1 to 2 do begin
    totalStudents:=0;
    write('Enter code of career: ');
    read(code);
    write('Enter the number of years of the career: ');
    read(years);
    for j:=1 to years do begin
      write('Enter the number of the students of ',j,' year: ');
      read(students);
      totalStudents:= totalStudents + students;
    end;
    average:= totalStudents/years;
    if(average<lwrAverage) then begin 
      lwrAverage:=average;
      careerCode:= code;
    end;
  end;
  write('Career ',code,' has the least number of students p/year ',lwrAverage:2:2);


end.
