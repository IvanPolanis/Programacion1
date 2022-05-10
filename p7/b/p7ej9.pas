



{*Una imagen digital es una estructura en forma de matriz donde cada elemento almacena un color
(pixel). En una imagen RGB (Red, Green, Blue) este elemento de color es una mezcla de
intensidades de los colores (canales) Rojo, Verde y Azul. 
a) Implemente módulos que permitan:
• copiar el contenido de una imagen en otra.
• rotar 90 grados una imagen.
• “espejar” horizontalmente una imagen}

Program p7ej9;

Type 
  Color = Record
    r: integer;
    g: integer;
    b: integer;
  End;
  ImagenRGB = Record
    ancho: integer;
    alto: integer;
    datos: array[1..1024, 1..1024] Of Color;
  End;

Procedure copiarImagen(original:ImagenRGBM; Var copia:ImagenRGB);

Var i,j: integer;
Begin
  For i:=1 To original.ancho Do
    Begin
      For j:=1 To original.alto Do
        copia.datos[i,j] := original.datos[i,j];
    End;
  copia.ancho := original.ancho;
  copia.alto := original.alto;

End;


Procedure rotarImagen(Var imagen:ImagenRGB);

Var aux: ImagenRGB;
  i,j: integer;
Begin
  copiarImagen(imagen,aux);
  k := aux.ancho;
  For i:=1 To aux.ancho Do
    Begin
      For j:=1 To aux.alto Do
        imagen.datos[j,k] := aux.datos[i,j];
      k := k-1;
    End;
  imagen.ancho := aux.alto;
  imagen.alto := aux.ancho;

End;

Procedure espejarImagen(original:ImagenRGB; Var espejo: ImagenRGB);

Var i,j,k: integer;
Begin
  k := original.ancho;
  For i:=1 To original.ancho Do
    Begin
      For j:=1 To original.alto Do
        imagen.datos[j,k] := original.datos[i,j];
      k := k-1;
    End;
End;
Begin

End.
