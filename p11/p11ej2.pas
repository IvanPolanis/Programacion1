





{. Se dispone de una estructura de datos con la información de personas que pagan su servicio de
cable a una empresa. De cada persona se conoce nombre, apellido, categoría del servicio (1
doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia), monto básico que debe pagar y la
dirección donde se le brinda el servicio (a lo sumo 70 caracteres). El monto final a pagar por el
servicio de cable se compone de un monto básico al que se le adiciona un importe extra de acuerdo
a la categoría del servicio. Para ello la empresa dispone de una tabla adicional donde para cada
categoría de servicio (1 doméstico, 2 empresa, 3 comercio, 4 sociedad de beneficencia) se indica el
monto extra a cobrar. Se pide:
a. Calcular el monto recaudado por la empresa para cada categoría de servicio.
b. El nombre de la persona que más pago por el servicio de cable de categoría 2. En caso de que
nadie haya pagado esta categoría de servicio, informar “nadie pagó servicio de cable categoría
2”.
c. Para cada persona indicar si su dirección cumple la siguiente forma: A % B % C donde:
• A debe ser una secuencia de letras mayúsculas de la “A”..”G” y caracteres dígitos pares.
• % es el carácter “%” que seguro existe.
• B debe ser exactamente las letras de A, en el mismo orden, donde para cada letra
mayúscula de A aparece su minúscula en B.
• C debe ser una secuencia donde están una única vez, todos los caracteres dígitos que no
aparecieron en A.
Ejemplo: DFG2A4EG % dfgaeg % 13057896 
Nota: Cada persona paga un solo impuesto. }

Program p11ej2;

Uses crt;

Type 
  cliente = Record
    nombre: string;
    apellido: string;
    categoria: integer;
    monto: integer;
    direccion: string[70];
  End;
  precioCat = Array[1..4] Of integer;
  conj = set Of char;
Procedure calcRecaudacion(Var vTotal:precioCat; l:list; precios:precioCat);

Var nomb: string;
  maximo: integer;
Begin
  maximo := 0;
  While l<> Do
    Begin
      vTotal[l^.dato.categoria] := vTotal[l^.dato.categoria] + l^.dato.monto + precios[l^.dato.categoria];
      If (l^.dato.categoria = 2) And (l^.dato.monto > maximo) Then
        Begin
          nomb := l^.dato.nombre;
          maximo := l^.dato.monto;
        End;
      l := l^.next;
    End;
End;
Function validarDireccion(direccion:String): boolean;
Procedure validarA(direccion:String;Var exito:boolean;Var aux:conj);

Var 
  i: integer;
  mayus,pares: conj;
Begin
  mayus := ['A'..'G'];
  pares := ['0','2','4','6','8'];
  aux := [];
  i := 1;
  exito := true;
  While (direccion[i]<>'%') And exito Do
    Begin
      If (direccion[i] In mayus) Or (direccion[i] In pares) Then
        Begin
          exito := true;
          If (direccion[i] In pares) And (Not(direccion[i] In aux)) Then
            Begin
              aux := aux+[direccion[i]];
            End;
        End
      Else exito := false;
      i := i+1;
    End;
End;

Function validarB(direccion:String): boolean;

Var i,j: integer; exito:boolean; pares:conj;
Begin
  pares := ['0','2','4','6','8'];
  i := 1;
  j := 1;
  While direccion[j] <> '%' Do
    j := j+1;
  j := j+1;
  exito := true;
  While exito And (direccion[j] <> '%') Do
    Begin
      If direccion[i] In pares Then begin
      end
      Else
        Begin
          If not(direccion[i] = chr((ord(direccion[j])-32))) Then exito := false;
          i := i+1;
          j := j+1;
        End;
    End;
    validarB:=exito;
End;

Function validarC(direccion:String; aux:conj): boolean;

Var i,longitud: integer; exito:boolean; digitos:conj;
Begin
digitos := ['0'..'9']-aux;
exito:=true;
    writeLn('soy un bucle xdxd');
  i := 1;
  While direccion[i] <> '%' Do
    i := i+1;
  i := i+1;
  While direccion[i] <> '%' Do
    i := i+1;
  i := i+1;
  longitud := length(direccion);
  While (i<= longitud) And exito Do
    Begin
    writeLn('soy un bucle xdxd');
      If direccion[i] In digitos Then digitos := digitos - [direccion[i]]
      Else exito := false;
      i := i+1;
    End;
  If digitos = [] Then exito := true
  Else exito := false;
  validarC := exito;
End;

Var aux: conj;
  exito: boolean;
Begin
  exito := false;
  
  validarA(direccion,exito,aux);
  if not(exito and validarB(direccion)) then exito:=validarC(direccion,aux);
  validarDireccion := exito;


End;

Begin

End.
