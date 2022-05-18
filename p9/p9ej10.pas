{* Una casa de venta de comidas ofrece a la venta una variedad de platos. La misma cuenta con un
software que utiliza dos estructuras de datos: una en donde almacena la información de sus clientes:
código de cliente, apellido, nombre, domicilio y teléfono; y otra en donde almacena la información de
los 100 platos diferentes que dispone. Los platos se encuentran codificados del 1 al 100 y de cada
uno se sabe: nombre y stock disponible. Realizar un programa que:
a) Lea información de pedidos de platos de comida. De cada pedido se conoce el código de
cliente que desea hacer el pedido, el código del plato que solicita y la cantidad de ese plato.
Para que el pedido pueda llevarse a cabo se deben realizar las validaciones correspondientes
y en caso de no existir ningún inconveniente, realizar la venta del mismo, caso contrario,
informar porque la venta no pudo ser realizada. Tener en cuenta que el código de cliente debe
ser de un cliente almacenado por la empresa, y debe existir suficiente stock del plato pedido.
La recepción de pedidos finaliza cuando se lee un código de cliente igual a -1.}
program p9ej10;

type 
platos= record
nombre:string;
stock:integer;
end;

begin
   
end.