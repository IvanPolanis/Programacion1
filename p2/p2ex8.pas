program p2ex8;
var
    i,words: integer;
    currChar, lastChar: char;
begin
  i:=0; words:=0; lastChar:='';
  repeat
    read(currChar);
    if(lastChar='' and currChar<>'') then begin
      words:= words + 1;
    end;
    if(lastChar<>'' and currChar='') then begin
      
    end;
    lastChar:=currChar;
    i:= i + 1;
  until (currChar = 'z') or (i=500)
end.