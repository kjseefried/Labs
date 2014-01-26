with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
package body RandomNumbers is


   --Generate a random number
   function RandomNumberBetween (min, max : Integer) return Integer is
      subtype RandDraw is Integer range min .. max;
      package RandInt is new Ada.Numerics.Discrete_Random (RandDraw);
      use RandInt;
      seed : Generator;
   begin
      reset (seed);
      return Random(seed);
   end RandomNumberBetween;





   --Fille the array with random numbers
   procedure FillArrayWithRandoms (arr : in out intArrayType) is
   begin
      for i in arr'Range loop
         arr(i):=RandomNumberBetween(arr'First, arr'Last);
      end loop;
   end FillArrayWithRandoms;

   Procedure PutAtRandomPlace (arr : in out intArrayType; value : in Integer) is
   begin
      arr (RandomNumberBetween (arr'First, arr'Last)) := value;
   end PutAtRandomPlace;




   --Print the content of the array
   procedure Print (arr : in intArrayType) is
   begin
      for i in arr'Range loop
         Ada.Text_IO.Put (arr (i)'img & " ");
      end loop;
   end Print;




   --Shuffle int array
   procedure shuffle(arr: in out intArrayType) is
      package Discrete_Random is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer);
      K : Integer;
      G : Discrete_Random.Generator;
      T : Integer;
   begin
      Discrete_Random.Reset(G);
      for I in reverse arr'Range loop
         K := (Discrete_Random.Random(G) mod I) + 1;
         T := arr(I);
         arr(I) := arr(K);
         arr(K) := T;
      end loop;
   end shuffle;




end RandomNumbers;
