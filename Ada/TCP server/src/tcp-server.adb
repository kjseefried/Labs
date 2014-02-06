package body TCP.Server is



 Procedure start is


 begin
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
  begin null; end;

 exception
  when Sockets.Socket_Error =>
   Put_Line ("Error occurred. Try another port.");
 end;







 task body listenerTask is
  status      : Sockets.Selector_Status;
  Client      : Sockets.Sock_Addr_Type;
  Connection  : Sockets.Socket_Type;
  stream      : Sockets.Stream_Access;

 begin
  loop

   Sockets.Accept_Socket (
			  Server  => Receiver,
			  Socket  => Connection,
			  Address => Client,
			  timeout => 30.0,
			  Status  => status
			 );


   -- Append the new stream to the clients
   stream := Sockets.Stream (Connection);
   channels.Append (stream);
   Put_Line ( Sockets.Image (Client) & " connected.");

   --Send a welcome message to connected client
   String'Output ( stream, "[Server] Connection successful!");


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

  procedure write (channelCursor : in channelList.Cursor) is
   channel : sockets.Stream_Access := channelList.Element (channelCursor);
  begin
   String'Output (channel, Message (Message'First .. MessageLength));
  end write;

 begin
  loop
   Put ("> ");
   Flush;
   Get_Line (Message, MessageLength);
   if Message'Length > 0  then
    channels.Iterate (write'Access );
   end if;
  end loop;
 end;



 task body readerTask is
  procedure read (channelCursor : in channelList.Cursor) is
   channel : Sockets.Stream_Access := channelList.Element (channelCursor);
  begin
   Put_Line ("incoming > " & String'Input ( channel ));
  end read;
 begin
  loop
  Put_Line(channels.Length'Img);
   delay 1.0;
   channels.Iterate (read'Access);
  end loop;
 end;




end TCP.Server;
