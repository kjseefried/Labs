package body TCP.Server is



 Procedure start is begin
  Ada.Text_IO.New_Line (50);
  Sockets.Create_Socket (Receiver);
  Sockets.Set_Socket_Option (Receiver, Option => (
						  Name    => Sockets.Reuse_Address,
						  Enabled => True));

  Sockets.Bind_Socket (Receiver, (
		       Family => Sockets.Family_Inet,
		       Addr   => Sockets.Inet_Addr (IP),
		       Port   => PORT));

  Sockets.Listen_Socket (Receiver);
  Put_Line ("Server started: " & IP & ":" & PORT'Img);

  declare
   lt : listenerTask;
  begin
   null;
  end;

 exception
  when Sockets.Socket_Error =>
   Put_Line ("Error occurred. Try another port.");
 end;







 task body listenerTask is
  status      : Sockets.Selector_Status;
  Client      : Sockets.Sock_Addr_Type;
  Connection  : Sockets.Socket_Type;
 begin
  loop

   Sockets.Accept_Socket (
			  Server  => Receiver,
			  Socket  => Connection,
			  Address => Client,
			  timeout => 30.0,
			  Status  => status
			 );


   channel := Sockets.Stream (Connection);
   Put_Line ( Sockets.Image (Client) & " connected.");
   String'Output ( channel, "Hello client");


    declare
     wt : writerTask;
     rt : readerTask;
    begin
     null;
    end;

  end loop;
 end;




 task body writerTask is
  Message       : String (1 .. 128);
  MessageLength : Natural;
 begin
  loop
   Put ("> ");
   Flush;
   Get_Line (Message, MessageLength);
   if Message'Length > 0  then

     String'Output (channel, Message (Message'First .. MessageLength));

   end if;
  end loop;
 end;



 task body readerTask is begin
  loop
  Flush;
   Put_Line ("incoming > " & String'Input ( channel ));
     end loop;
 end;




end TCP.Server;
