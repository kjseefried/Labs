Package RandomNumbers is
   type intArrayType is array (Positive range <>) of Integer;

   function  RandomNumberBetween (min, max : Integer) return Integer;
   procedure FillArrayWithRandoms (arr : in out intArrayType);
   Procedure PutAtRandomPlace (arr : in out intArrayType; value : in Integer);
   procedure Print(arr:in intArrayType);
   procedure shuffle(arr: in out intArrayType);
end RandomNumbers;
