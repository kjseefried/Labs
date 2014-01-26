Package body Graphics.Snake is

Procedure Draw(ABuffer: in out Buffer; ASnake:in  Snake_Type ) is begin 
	for i in ASnake'range loop 
		if 	ASnake(i)(1)>=80-2 then 
			Put(ABuffer, 	(ASnake(i)(1),ASnake(i)(2))		,'O');
			
		elsif ASnake(i)(1)<=2 then 
			Put(ABuffer, 	(78,ASnake(i)(2))		,'O');
			
		elsif ASnake(i)(2)>=24-2 then 
			Put(ABuffer, 	(ASnake(i)(1),2)		,'O');
			
		elsif ASnake(i)(2)<=2 then 
			Put(ABuffer, 	(ASnake(i)(1),22)		,'O');	
			
		else Put(ABuffer,	ASnake(i)				,'O'); 
		end if; 
	end loop;
end Draw; 


Procedure Move(ASnake : in out Snake_Type; x,y: Integer) is 
	i:integer:=ASnake'Length; 
	Procedure Tail is begin
		loop
			exit when i=1; 
			ASnake(i):=ASnake(i-1);
			i:=i-1;
		end loop; 
	end Tail; 
begin 
	
	if y=-1 and (ASnake(1)(1),ASnake(1)(2)+1)/=ASnake(2) then 
			Tail;
			ASnake(1):=(ASnake(1)(1),ASnake(1)(2)+1);		
	end if; 
	if y=1 	and (ASnake(1)(1),ASnake(1)(2)-1)/=ASnake(2) then 
		Tail; 
		ASnake(1):=(ASnake(1)(1),ASnake(1)(2)-1);	 	 
	end if;	
	if x=-1 and (ASnake(1)(1)-1,ASnake(1)(2))/=ASnake(2) then
		Tail; 	
		ASnake(1):=(ASnake(1)(1)-1,ASnake(1)(2)); 	
	end if;	
	if x=1 	and (ASnake(1)(1)+1,ASnake(1)(2))/=ASnake(2) then
		Tail; 	 ASnake(1):=(ASnake(1)(1)+1,ASnake(1)(2)); 	
	end if;	
	
	--A:=(s'First..s'Last-1)
	
end Move; 

end Graphics.Snake;
