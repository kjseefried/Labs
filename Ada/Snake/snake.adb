
with Graphics; use Graphics;
with Graphics.Snake; use Graphics.Snake;
With Ada.Text_IO; use Ada.Text_IO; 

procedure Snake2 is
	
                               
   C : Character; 
   B : Buffer (1 .. 24, 1 .. 80);
   S : Snake_Type (1 .. 5) := ((10, 10),
                               (10, 11),
                               (10, 12),
                               (11, 12),
                               (12, 12));
   D : Duration := 0.07;
   
   LastDirection:Character; 
   
   Procedure DoTheLastMove is 
   begin
   	case LastDirection is 
   			when 'w' =>	Move(S, 0, 1); 	  
   			when 'a' =>	Move(S, -1, 0);	
   			when 'd' =>	Move(S, 1, 0); 	
   			when 's' =>	Move(S, 0, -1);	
   			when Others => Null;
   	end case; 
   end DoTheLastMove; 
   
begin
   loop
   
   	Empty (B);
   	Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      
      
    Get_Immediate(C);
   	
   	case C is 
   			when 'w' =>	Move(S, 0, 1); 	LastDirection := 'w';  
   			when 'a' =>	Move(S, -1, 0);	LastDirection := 'a'; 
   			when 'd' =>	Move(S, 1, 0); 	LastDirection := 'd'; 
   			when 's' =>	Move(S, 0, -1);	LastDirection := 's'; 
   			when 'x' => exit; 
   			when Others => DoTheLastMove;
   	end case; 
   	
   	
      delay D;



   	   		
      
   end loop;
end Snake2;