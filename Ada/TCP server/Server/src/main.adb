with TCP.Server;
with Ada.IO_Exceptions;
with Ada.Text_IO;

procedure main is

   Package server0 is new TCP.Server ("127.0.0.1", 5204);

begin
   server0.start;
   server0.printInfo;
   loop
      server0.searchForClients;
      server0.BeginStreaming;
      begin
         loop
	    server0.Write ("Hello World");
	    delay(1.0);
         end loop;
      exception
	 when Others => Ada.Text_IO.Put_Line("Client has been disconnected!");
      end;
      --server0.stop;
   end loop;
end main;
