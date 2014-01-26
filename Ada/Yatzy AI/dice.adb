with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

package body dice is

   function get_many(someDices:dices;n:integer) return dices is
      j:integer := 0;
      result : dices(1..6);
   begin
      for i in someDices'range loop
         if number_of( result(1..j),someDices(i) ) = 0 then
            if number_of(someDices,someDices(i)) = n then
               j := j +1;
               result(j) := someDices(i);
            end if;
         end if;
      end loop;
      return result(1..j);
   end;

   function number_of(someDices:dices;theDice:dice) return integer is
      j : integer := 0;
   begin
      for i in someDices'range loop
         if someDices(i) = theDice then
            j := j +1;
         end if;
      end loop;
      return j;
   end;

   function get_house(someDices:dices) return dices is
      pair : dices := get_many(someDices,2);
      three : dices := get_many(someDices,3);
      dummy : dices(1..2) := (1,1);
   begin
      if three'length = 1 and pair'length = 1 then
         return three&pair;
      end if;
      return dummy;
   end;

   function roll return dice is
      package R is new Ada.Numerics.Discrete_Random(dice);
      use R;
      G : Generator;
   begin
      Reset(G);
      return Random(G);
   end roll;

   function roll(someDices:dices) return dices is
      rolledDices : dices := someDices;
   begin
      for i in someDices'range loop
         rolledDices(i) := roll;
         null;
      end loop;
      return rolledDices;
   end;

   function exctract_full_house(someDices:dices) return dices is
   begin
      return (1,2);
   end;

   function exctract_pair(someDices:dices) return dices is
   begin
      return (1,2);
   end;


   procedure print(someDices:dices) is
   begin
      for i in someDices'range loop
         put( someDices(i)'img & ", " );
      end loop;
   end;

   procedure print_pretty(someDices:dices) is
   begin
      for r in 0..4 loop
         for i in someDices'range loop
            if( (r=0 or r=4) ) then put(" =====  "); end if;
            if(
               (someDices(i) = 1 and (r=1 or r=3)) or
                 (someDices(i) = 2 and (r=2)) or
                 (someDices(i) = 4 and (r=2))
              ) then put("|     | "); end if;
            if(
               (someDices(i) = 2 and (r=3)) or
                 (someDices(i) = 3 and (r=3))
              ) then put("|*    | "); end if;
            if(
               (someDices(i) = 1 and (r=2)) or
                 (someDices(i) = 3 and (r=2)) or
                 (someDices(i) = 5 and (r=2))
              ) then put("|  *  | "); end if;
            if(
               (someDices(i) = 2 and (r=1)) or
                 (someDices(i) = 3 and (r=1))
              ) then put("|    *| "); end if;
            if(
               (someDices(i) = 6 and (r=1 or r=2 or r=3)) or
                 (someDices(i) = 5 and (r=1 or r=3)) or
                 (someDices(i) = 4 and (r=1 or r=3))
              ) then put("|*   *| "); end if;
         end loop;
         new_line;
      end loop;
   end;


end dice;
