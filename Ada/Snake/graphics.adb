With Ada.Text_IO; use Ada.Text_IO; 
With Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 
 
Package body Graphics is
Procedure Put(ABuffer: in out Buffer; APoint:in Point; AChar:in Character ) is begin
	ABuffer(APoint(2),APoint(1)) := AChar; 
end Put;  



Procedure Draw_HLine(ABuffer:in out Buffer; StartPoint:in Point; Length:in Positive) is begin 
	for i in 1..Length loop
		Put(ABuffer, (StartPoint(1)+i-1,StartPoint(2)), '#');
	end loop; 
end Draw_HLine; 



Procedure Draw_VLine(ABuffer:in out Buffer; StartPoint:in Point; Length:in Positive) is  begin 
	for i in 1..Length loop
		Put(ABuffer, (StartPoint(1),StartPoint(2)+i-1), '#');
	end loop; 
end Draw_VLine; 



Procedure Draw_Rect(ABuffer:in out Buffer; StartPoint:in Point; Width,Height:in Positive) is begin 
	Draw_VLine(ABuffer, StartPoint, Height);
	Draw_VLine(ABuffer, (Width,StartPoint(1)), Height);
	Draw_HLine(ABuffer, StartPoint, Width);
	Draw_HLine(ABuffer, (StartPoint(2),Height), Width);
end Draw_Rect; 



Procedure Empty(ABuffer:in out Buffer) is begin  
	for i in ABuffer'range(1) loop
		for j in ABuffer'range(2) loop
			ABuffer(i,j):=' '; 
		end loop; 
	end loop; 
end Empty; 



Procedure Update(ABuffer:in Buffer) is begin
	for i in ABuffer'range(1) loop
		for j in ABuffer'range(2) loop
			Put(ABuffer(i,j)); 
		end loop; 
	end loop;
end Update; 

end Graphics;