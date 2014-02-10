package body TCP.Server is

 -----------
 -- Start --
 -----------
 Procedure Start is
  lt : Listener_Task;
  wt : Writer_Task;
  rt : Reader_Task;
 begin
  null;
 end Start;


 task body Listener_Task is

  status      : Sockets.Selector_Status;
  Client      : Sockets.Sock_Addr_Type;
  Connection  : Sockets.Socket_Type;
  stream      : Sockets.Stream_Access;

 begin

  Sockets.Create_Socket (Receiver);

  Sockets.Set_Socket_Option (Receiver, Option => (
						  Name    => Sockets.Reuse_Address,
						  Enabled => True));

  Sockets.Bind_Socket (Receiver, (
		       Family => Sockets.Family_Inet,
		       Addr   => Sockets.Inet_Addr ( IP ),
		       Port   => Port));

  Sockets.Listen_Socket (Receiver);
  Put_Line ( "Server started: " & IP & ":" & PORT'Img );

  loop


   Sockets.Accept_Socket (
			  Server  => Receiver,
			  Socket  => Connection,
			  Address => Client,
			  timeout => 30.0,
			  Status  => status
			 );

   stream := Sockets.Stream (Connection);
   channels.Append (stream);
   Broadcast ( Message => Sockets.Image (Client) & " connected." );
  end loop;


 exception
  when Sockets.Socket_Error =>
   Put_Line ( "Error occurred. Try another port." );

 end;







 task body Reader_Task is

  procedure read (channelCursor : in channelList.Cursor) is
   channel : Sockets.Stream_Access := channelList.Element (channelCursor);
  begin
   Put_Line ( sockets.Image (sockets.Get_Address ( channel )) &
	      String'Input ( channel ));
  end read;

 begin
  loop
   channels.Iterate (read'Access);
  end loop;
 end Reader_Task;






  task body Writer_Task is
  Message       : String (1 .. 128);
  MessageLength : Natural;
 begin
  loop
   Get_Line (Message, MessageLength);
   if Message'Length > 0  then
    Broadcast ( Message (Message'First .. MessageLength) );
   end if;
  end loop;
 end Writer_Task;










 procedure Broadcast ( Message : in String; Author : in String := "Server> ") is

  procedure write (channelCursor : in channelList.Cursor) is
   channel : sockets.Stream_Access := channelList.Element (channelCursor);
  begin
   String'Output (channel, Author & Message);
   Put_Line ( Author & Message );
  end write;

 begin
  channels.Iterate (write'Access);
 end Broadcast;









end TCP.Server;
