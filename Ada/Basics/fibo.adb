With Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   function fibo(n:Natural) return Natural is
   begin
      Put_Line("Beräknar fibo("& n'Img &")");
      if n=0 or n=1 then
      	return 1;
      else
   	return fibo(n-1)+fibo(n-2);
      	end if;
   end fibo;
begin
   Put_Line(fibo(3)'img);
   null;
end Main;
