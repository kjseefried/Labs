package ToolBox is

   procedure Get (Value : out Integer);
   procedure Print (Value : in Integer);
   procedure Print (Value : in Boolean);

   function Get return Integer;
   function ToInteger (Input:Character) return Integer;
   function Addition  (left,right : in Integer) return Integer;
   function Multiplication (left,right : in Integer) return Integer;

private

end ToolBox;
