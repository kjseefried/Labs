with Ada.Text_IO;
with LinkedListHandler;
with Ada.Numerics;
with Ada.Numerics.Discrete_Random;

procedure Main is




   package IntList is new LinkedListHandler(Integer);
   List0 : IntList.List;

   function Printer(Integer0 : in Integer) return boolean is
   begin
      if Integer0 < 10 then
	 Ada.Text_IO.Put_Line("i = "&Integer0'img);
      end if;
      return True;
   end;


   type ArrayOfInteger is array (1..10**6) of Integer;
   procedure ShuffleArrayOfInteger (List : in out ArrayOfInteger) is
      package Discrete_Random is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer);
      K : Integer;
      G : Discrete_Random.Generator;
      T : Integer;
   begin
      Discrete_Random.Reset(G);
      for I in reverse List'Range loop
         K := (Discrete_Random.Random(G) mod I) + 1;
         T := List(I);
         List(I) := List(K);
         List(K) := T;
      end loop;
   end ShuffleArrayOfInteger;


   ArrayOfInteger0 : ArrayOfInteger;


begin



   Ada.Text_IO.Put_Line("[Create a..b]");
   for i in ArrayOfInteger0'range loop
      ArrayOfInteger0(i) := i;
   end loop;
   Ada.Text_IO.Put_Line("[Shuffle a..b]");
   ShuffleArrayOfInteger(ArrayOfInteger0);
   Ada.Text_IO.Put_Line("[Add a..b]");
   for i in ArrayOfInteger0'range loop
      IntList.AddLast(List0,ArrayOfInteger0(i));
   end loop;
   Ada.Text_IO.Put_Line("[Shuffle a..b]");
   ShuffleArrayOfInteger(ArrayOfInteger0);
   Ada.Text_IO.Put_Line("[Exist a..b]");
   for i in ArrayOfInteger0'range loop
      if i mod 1000 = 0 then
         Ada.Text_IO.Put_Line( IntList.IsThere(List0,ArrayOfInteger0(i))'img );
      end if;
   end loop;


end Main;
