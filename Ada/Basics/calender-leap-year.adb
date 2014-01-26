With Ada.Text_IO, Ada.Integer_Text_IO;
Use Ada.Text_IO, Ada.Integer_Text_IO;

Procedure Uppgift_4 is

   Function isLeap (i : in Integer) return integer is
   begin
      if ((i mod 4 = 0) and (i mod 100 /= 0)) or  (i mod 400=0) then
         return 1;
      else
         return 0;
      end if;
   end isLeap;

   Function daysOfMonth (i : in Integer) return integer is
      arr : array(1..12) of Integer := (31,29,31,30,31,30,31,31,30,31,30,31);
   begin
      return arr(i);
   end daysOfMonth;

   Days, Year, Month, Day : Integer := 0;


begin
   Year := 0;
   Month:= 1;
   Day 	:= 1;

   for i in 1..Year-1 loop
      Days := Days + 365 + isLeap(i);
   end loop;

   for i in 1..Month-1 loop
      Days := Days +  daysOfMonth(i);
   end loop;

   Days := Days + Day;
   Put_Line(Days'img);

end Uppgift_4;
