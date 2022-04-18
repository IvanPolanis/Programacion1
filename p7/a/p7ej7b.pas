
Program p7ej7b;

Type vector = Array['a'..'z'] Of boolean;

Procedure setFalse(Var v:vector);

Var i: char;
Begin
  For i:='a' To 'z' Do
    v[i] := false;
End;

Procedure cargarVector(Var v:vector);

Var n: char;
Begin
  readln(n);
  While (n <> '.') Do
    Begin
      v[n] := true;
      ReadLn(n);
    End;
End;

Procedure unionarray(Var v1,v2,v:vector);
var i:char;
Begin
  For i:='a' To 'z' Do
    Begin
        if v1[i] or v2[i] then 
        begin
          v[i]:=true;
        end;
    End;
End;

Procedure diferencia(Var v1,v2,v:vector);
var i:char;
Begin
  For i:='a' To 'z' Do
    Begin
        if v1[i]=v2[i] then 
        begin
          v[i]:=false;
        end else v[i]:=v1[i];
    End;
End;

Begin

End.
