with LinkedList;
with Ada.Calendar; use Ada.Calendar;
with RandomNumbers;
with Ada.Text_IO; use Ada.Text_IO;
with CashRegister;
generic
   nCashRegisters : integer;
   OptimalWaitingTime : Integer;
Package Store is

   WaitingTime : integer := OptimalWaitingTime;

   type CashRegisterType is array (Positive range <>) of CashRegister.instance;

   type Store is record
      cashRegisters 		: CashRegisterType(1 .. nCashRegisters);
      activeCashRegisters	: Natural := 0;
      todaysCustomers 		: Natural := 0;
      currentCustormers 	: Natural :=0;
      startTime 		: Time := Clock;
   end record;


   procedure NewCustomer (store0 : in out store; n : in integer; slowspeed : in natural);
   Procedure Print (store0 : in out Store);
   procedure Update (store0 : in out Store);

end Store;
