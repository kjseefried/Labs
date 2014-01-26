With Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings, Ada.Strings.Fixed;
Use Ada.Text_IO, Ada.Integer_Text_IO;

Procedure Uppgift_3 is

   Type color is range 0..255;
   Type Bucket is record
      Volume 	:	Integer;
      Red	:	color;
      Green	: 	color;
      Blue	: 	color;
   end record;

   A, B, C : Bucket;


   --Print out Buckets properties
   Procedure Put(B : in Bucket) is
   begin
      Put_Line(
               "Volume: "	 & B.Volume'img
               &" Colors: " & B.Red'img
               &" "		 & B.Green'img
               &" "		 & B.Red'img);
   end Put;


   --Mix two buckets together. Return mixed bucket
   Function "+"(A,B: in Bucket) return Bucket is
      Z : Bucket;
   begin
      Z.Volume 	:= A.Volume + B.Volume ;
      Z.Red 		:= color((Integer(A.Red)   * A.Volume + Integer(B.Red)   *B.Volume) / (A.Volume + B.Volume));
      Z.Green		:= color((Integer(A.Green) * A.Volume + Integer(B.Green) *B.Volume) / (A.Volume + B.Volume));
      Z.Blue		:= color((Integer(A.Blue)  * A.Volume + Integer(B.Blue)  *B.Volume) / (A.Volume + B.Volume));
      return Z;
   end "+";

begin
   Put_Line("Uppgift 3");

   A.Volume 	:= 2;
   A.Red	:= 30;
   A.Green 	:= 20;
   A.Blue	:= 10;

   B.Volume 	:= 1;
   B.Red	:= 20;
   B.Green 	:= 30;
   B.Blue	:= 40;

   C := A+B;

   Put(C);

end Uppgift_3;
