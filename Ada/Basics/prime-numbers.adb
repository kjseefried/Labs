With Ada.Text_IO; use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
Procedure Ex5 is
   	i,f,x: Integer;
	function IP(n : Integer) return Boolean is begin
		i := 2;
		loop
			if n mod i = 0 then
				return false;
			end if;
			exit when i = n-1;
			i := i + 1;
		end loop;
		return true;
	end IP;
begin
	 Put_Line("Exercise 5");
	x:=1; --Start Value(should be an odd number )
	loop
		x:=x+2;
		if IP(x) then f:=f+1; Put(x'img & " "); end if; --'
		exit when f>20; --How many to find
	end loop;
end Ex5;
