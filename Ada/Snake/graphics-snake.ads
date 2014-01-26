Package Graphics.Snake is

type Snake_Type is array(Positive range <>) of Point; 

Procedure Draw(ABuffer: in out Buffer; ASnake:in  Snake_Type);
Procedure Move(ASnake : in out Snake_Type; x,y: Integer);

end Graphics.Snake;
