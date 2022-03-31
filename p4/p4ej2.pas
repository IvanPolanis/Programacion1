{a) Defina un tipo de dato que represente el tiempo en horas y minutos.
b) Implemente un módulo que reciba 2 parámetros de tipo tiempo y devuelva la diferencia
transcurrida en horas y minutos.
c) * Realice 2 implementaciones diferentes de un módulo que reciba 2 parámetros de tipo
tiempo y retorne el menor de los 2.}
program p4ej2;
type 
    tiempo= 0..1440;
function diff(t1,t2: tiempo):integer;
var difference: integer;
begin   
    difference:= t1-t2;
    if(difference<0) then difference:= -difference;
    diff:= difference;
end;
function minor(t1,t2:tiempo):integer;
begin
  if(t1<t2) then begin minor:=t1 end else minor:=t2;
end;
function setTime():integer;
var h,m: integer;
begin
    read(h);
    read(m);
  setTime:=h*60+m;
end;
var
    t1,t2: tiempo;
begin
  t1:=setTime();
  t2:=setTime();
  writeln((diff(t1,t2)DIV 60):2,':', (diff(t1,t2)MOD 60):2);
  writeln((minor(t1,t2)DIV 60):2,':', (minor(t1,t2)MOD 60):2);

end.