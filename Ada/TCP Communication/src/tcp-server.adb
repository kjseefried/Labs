package body TCP.Server is

 -----------
 -- Start --
 -----------
 Procedure Start is
 begin
    Sockets.Create_Socket (Receiver);

    Sockets.Set_Socket_Option (Receiver, Option => (
  	Name    => Sockets.Reuse_Address,
	Enabled => True));

    Sockets.Bind_Socket (Receiver, (
  	Family => Sockets.Family_Inet,
	Addr   => Sockets.Inet_Addr( IP ),
  	Port   => Port));

    Sockets.Listen_Socket (Receiver);
    Put_Line ( "Server started: " & IP & ":" & PORT'Img );

    declare
       lt : Listener_Task;
    begin
       null;
    end;

 exception
    when Sockets.Socket_Error =>
       Put_Line ( "Error occurred. Try another port." );

 end Start;







 task body Listener_Task is
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
    wt : Writer_Task;
    rt : Reader_Task;
   begin
    null;
   end;

  end loop;
 end;








 task body Writer_Task is
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

 end Writer_Task;






 task body Reader_Task is

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

 end Reader_Task;




end TCP.Server;
