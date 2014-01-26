Package Graphics is

type Buffer is array(Positive range <>,Positive range <>) of Character; 
type Point is array(1..2) of Integer; 

Procedure Put(ABuffer: in out Buffer; APoint:in Point; AChar:in Character );
Procedure Draw_HLine(ABuffer:in out Buffer; StartPoint:in Point; Length:in Positive);
Procedure Draw_VLine(ABuffer:in out Buffer; StartPoint:in Point; Length:in Positive);
Procedure Draw_Rect(ABuffer:in out Buffer; StartPoint:in Point; Width,Height:in Positive);
Procedure Empty(ABuffer:in out Buffer);
Procedure Update(ABuffer:in Buffer);

end Graphics;