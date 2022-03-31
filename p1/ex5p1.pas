{Un parque natural requiere un programa realice el seguimiento del peso de sus osos
hormigueros. De cada animal se debe leer por teclado su edad y peso hasta que se ingrese una edad
negativa. Se requiere informar para aquellos animales menores de 3 años el menor peso y peso
promedio, mientras que para los que tienen 3 años o más se pide informar el peso máximo y el peso
promedio.}

program ex5p1;
var
  age,i,j: integer;
  weight, lowerWeight, greaterWeight:integer; average2, average3: real;  
begin
  read(age);
  lowerWeight:=9999;
  greaterWeight:=0;
  i:=0;
  j:=0;
  average3:=0;
  average2:=0;
  while (age>-1) do begin
    write('Enter weight of bear: ');
    read(weight);
    if(age<3) then begin
      if (weight < lowerWeight) then lowerWeight:= weight;
      average2:= average2 + weight;
      i:= i + 1;
    end else if (age >= 3) then begin 
      if (weight < greaterWeight) then greaterWeight:= weight;
      average3:= average3 + weight;
      j:= j + 1;
    end;
    write('Enter age of the bear (negative to exit): ');
    read(age)
  end;
    if (i>0) then write('Baby bears, lower weight: ', lowerWeight, ' and their wieght average is: ', average2/i:2:2);
    if (j>0) then write('Old bears, greater weight: ', greaterWeight, ' and their wieght average is: ', average3/j:2:2);      
end.

