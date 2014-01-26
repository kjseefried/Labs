with LinkedList;
with RandomNumbers; use RandomNumbers;

Package CashRegister is

   --Config
   ScanDuration 	: Integer := 1;
   CreditCardPayment 	: Integer := 10;
   CashPayment 		: Integer := 12;

   --stats
   nScannedItems        : Integer;

   type customer is record
      groceries 	: Natural;                           -- If 0 then no item has been bought. Zigenare
      StandingInQueue 	: Boolean := True;
      slowspeed : Natural := 0;
   end record;


   package CustomerListHandler is new LinkedList (customer);


   type instance is record
      queue  : CustomerListHandler.List;
      active : Boolean := false;
   end record;

   Procedure Update (instance0 : in out instance);
   Procedure AddCustomer (instance0 : in out instance; nGroceries : in natural; slowspeed0 : in natural);
   Procedure RemoveCustomer (instance0 : in out instance);


   function  ETA (instance0 : in instance) return Integer;    --Estimated time for the last person to finish
   procedure Print(instance0: in instance);

   Procedure Close (instance0 : in out instance);
   Procedure Open (instance0 : in out instance);
   function IsOpen(instance0: instance ) return Boolean;
   function IsClosed(instance0: instance ) return Boolean;

end CashRegister;
