with Ada.Text_IO;
package body CashRegister is

   ------------
   -- Update --
   ------------

   procedure Update (instance0 : in out instance) is
   begin

      if not instance0.queue.IsEmpty then
	 if instance0.queue.Head.Value.groceries > 0 then
	    instance0.queue.Head.Value.groceries := instance0.queue.Head.Value.groceries - 1;
	    nScannedItems := nScannedItems + 1;
	 elsif instance0.queue.Head.Value.slowspeed > 0 then
            instance0.queue.Head.Value.slowspeed := instance0.queue.Head.Value.slowspeed - 1;
         else
	    RemoveCustomer (instance0);
	    --Close cash register if the que is emptied
	    if instance0.queue.Length = 0 then
	       instance0.active := false;
	    end if;
	 end if;
      end if;


   end Update;

   -----------------
   -- AddCustomer --
   -----------------

   procedure AddCustomer (instance0 : in out instance; nGroceries : in natural; slowspeed0: in natural)is
   begin
      instance0.queue.AddLast (customer'(
	groceries       => nGroceries,
	StandingInQueue => True,
	slowspeed => slowspeed0
       ));
   end AddCustomer;

   --------------------
   -- RemoveCustomer --
   --------------------

   procedure RemoveCustomer (instance0 : in out instance) is
   begin
      instance0.queue.RemoveFirst;
   end RemoveCustomer;

   -----------
   -- Close --
   -----------

   procedure Close (instance0 : in out instance) is
   begin
      instance0.active := false;
   end Close;

   ----------
   -- Open --
   ----------

   procedure Open (instance0 : in out instance) is
   begin
      instance0.active := true;
   end Open;

   ------------
   -- isOpen --
   ------------

   function IsOpen (instance0 : instance) return Boolean is
   begin
      return instance0.active;
   end IsOpen;
   function IsClosed (instance0 : instance) return Boolean is
   begin
      return not instance0.active;
   end IsClosed;

   ---------
   -- ETA --
   ---------

   function ETA (instance0 : in instance) return Integer is
      totalGroceries : integer := 0;
      SumSlowSpeed    : Integer := 0;
      function count (customer0 : customer) return Boolean is begin
	 totalGroceries := totalGroceries + customer0.groceries;
	 SumSlowSpeed := SumSlowSpeed + customer0.slowspeed;
	 return true;
      end count;

   begin
      instance0.queue.Walk (count'Access);
      return totalGroceries * ScanDuration + SumSlowSpeed;
   end ETA;



   Procedure print (instance0 : in instance) is begin
      Ada.Text_IO.Put_Line (". Active:" & instance0.active'Img & ". In que:" & instance0.queue.Length'img & ". ETA: " & ETA (instance0)'img);
   end print;
end CashRegister;
