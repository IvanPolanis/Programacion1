{Se lee una sucesión de números enteros que termina en 9999. Obtener e informar la suma de
todas las unidades y los dos dígitos mayores en cada número.
Ejemplo: si se lee 2 32 4201 372 23025 9999 (no se procesa)
Los dígitos mayores de cada número a informar son 2 3-2 4-2 7-3 5-3 respectivamente
La suma de las unidades a informar es 12}
program ex2p2;
var
    dig,numero,max1,max2,sumaU: integer;
    isUni: boolean;
begin
    isUni:=true; max1:=0; max2:=0; sumaU:=0;
    read(numero);
    while (numero<>9999) do begin
        while (numero<>0) do begin
            dig:= numero MOD 10;
            if(isUni) then begin
                sumaU:=sumaU+dig;
                isUni:=false;
            end;
            if(dig>max1) then begin
                max2:= max1;
                max1:=dig;
                write('hora')
            end else if ((dig>max2) and (dig<>max1)) then max2:=dig; 
            numero:= numero DIV 10;
        end;
        writeln(max1,' ',max2);
        max1:=0;max2:=0;isUni:=true;
        read(numero);
    end;
    writeln('La suma de todas las unidades es: ',sumaU)
end.