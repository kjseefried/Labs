with store;
with RandomNumbers; use RandomNumbers;

procedure Main is


   package ICA is new store ( nCashRegisters => 5, OptimalWaitingTime => 90 );
   --package ICAMAXI is new store ( length => 10, OptimalWaitingTime => 90 );
   nHours               : Natural   := 5;
   MaxCustomerFlow      : Positive  := 2;
   MaxGroceries         : Integer   := 20;
   ICA0                 : ICA.store;
  -- ICAMAXI0             : ICAMAXI.Store;


   task AdderTask;
   task ProcessingTask;
   task PrintingTask;

   task body adderTask is  begin
      loop
	 if ICA0.todaysCustomers < 1000 then
	    ICA.NewCustomer (ICA0, RandomNumberBetween (0, MaxGroceries),RandomNumberBetween (3, 5));
	    --ICAMAXI.NewCustomer (ICAMAXI0, RandomNumberBetween (0, MaxGroceries));
	 end if;
	 delay Duration (RandomNumberBetween (0, MaxCustomerFlow));
      end loop;
   end adderTask;

   task body ProcessingTask is begin
      loop
	 ICA.update (ICA0);
	 delay 0.1;
      end loop;
   end ProcessingTask;

   task body PrintingTask is begin
      loop
         ICA.print (ICA0);
	 delay 1.0;
      end loop;
   end PrintingTask;


begin
   null;
end Main;
