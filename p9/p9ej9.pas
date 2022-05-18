{* Se cuenta con una lista que contiene información de las ventas realizadas por una empresa de
venta de pasajes aéreos. Cada venta está compuesta por un nombre de persona, código de vuelo,
categoría de pasaje y número de asiento. La lista puede contener 0, 1 o más registros por cada
código de vuelo, y está ordenada por este campo.
El costo de un pasaje depende del vuelo y de su categoría. Se dispone de una estructura eficiente
que por cada combinación de vuelo (son 30) y categoría (4 por vuelo) se almacena su precio.
a) Generar una lista de registros que contenga por cada código de vuelo, el total de pasajes
vendidos y el monto total recaudado.
b) Calcular e informar los códigos de los 5 vuelos más vendidos.
c) Generar una lista de los códigos de vuelos cuya cantidad de pasajes vendidos sea mayor que
46. La lista debe ir generándose ordenada por monto total a medida que se realiza el proceso a).
}
program p9ej9;
type ventas= record
nombre:string;
codigo:integer;
categoria:string;
end;

begin
  
end.