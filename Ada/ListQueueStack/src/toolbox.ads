package ToolBox is

   procedure Get(Value : in out Integer);
   procedure Print(Value : in out Integer);
   function Get return Integer;
   function ToInteger (Input:Character) return Integer;
   function Addition  (left,right : in Integer) return Integer;
   function Multiplication (left,right : in Integer) return Integer;

private

end ToolBox;
