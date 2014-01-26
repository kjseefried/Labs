package body Store is


   procedure NewCustomer (Store0 : in out Store; n : in integer; slowspeed : in natural) is
   begin
      CashRegister.Open(Store0.cashRegisters(Store0.cashRegisters'First));
      for i in Store0.CashRegisters'range loop
	 --Otherwise add customer to an open cash register
  --Open a new cash register if wainting time is long

	 if CashRegister.IsOpen(Store0.CashRegisters(i)) then
	    if CashRegister.ETA(Store0.CashRegisters(i)) < WaitingTime then
	       CashRegister.AddCustomer( Store0.CashRegisters (i), n, slowspeed );
	       Store0.TodaysCustomers := Store0.TodaysCustomers + 1;
	    else
	       if Store0.ActiveCashRegisters = Store0.CashRegisters'Length then
		  WaitingTime := WaitingTime + 10; --Longen the waiting time if all CashRegisters are active.
	       else
		  if CashRegister.IsClosed(Store0.CashRegisters(i + 1)) then
		     CashRegister.Open(Store0.CashRegisters(i + 1));
		     Store0.ActiveCashRegisters := Store0.ActiveCashRegisters + 1;
		  end if;
	       end if;
	    end if;
	 end if;


      end loop;
   end NewCustomer;


   procedure Update (Store0 : in out Store) is
   begin
      for i in Store0.CashRegisters'range loop
	 if CashRegister.IsOpen(Store0.CashRegisters(i)) then
	    CashRegister.Update(Store0.CashRegisters(i));
	 end if;
      end loop;
   end Update;



   procedure Print (Store0 : in out Store) is
   begin
      store0.currentCustormers := 0;
      for i in store0.cashRegisters'Range loop
	 Put ("" & i'img);
	 cashregister.print (store0.cashRegisters (i));
	 store0.currentCustormers := store0.currentCustormers + store0.cashRegisters (i).queue.Length;
      end loop;
      Ada.Text_IO.Put_Line ("Current customers:" & store0.currentCustormers'Img);
      Ada.Text_IO.Put_Line ("Todays customers:" & store0.todaysCustomers'img);
      Ada.Text_IO.Put_Line ("Total scanned groceries:" & cashregister.nScannedItems'Img);
      Ada.Text_IO.Put_Line ("------------------------------------");
   end Print;



end Store;
