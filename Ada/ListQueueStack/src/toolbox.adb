with Ada.Text_IO, Ada.Integer_Text_IO;

package body ToolBox is

   procedure Get (Value : in out Integer) is
   begin
      Ada.Integer_Text_IO.Get (Value);
   end Get;

   procedure Print (Value : in out Integer) is
   begin
      Ada.Text_IO.Put_Line (Value'Img & "");
   end Print;

   function Get return Integer is
      Value : Integer;
   begin
      Ada.Integer_Text_IO.Get (Value);
      return Value;
   end Get;

   function ToInteger (Input : Character) return Integer is
   begin
      return Character'Pos (Input) - 48;
   end ToInteger;

   function Addition (Left, Right : in Integer) return Integer is
   begin
      return left + right;
   end Addition;

   function Multiplication (Left, Right : in Integer) return Integer is
   begin
      return left * right;
   end Multiplication;

end ToolBox;
