package body TCP.Server is

 -----------
 -- Start --
 -----------

 Procedure Start( IP : in String; Port : in Sockets.Port_Type ) is
    Status      : Sockets.Selector_Status;
    Client      : Sockets.Sock_Addr_Type;
    Connection  : Sockets.Socket_Type;
    Receiver    : Sockets.Socket_Type;
 begin

  Ada.Text_IO.New_Line(50);
  Sockets.Create_Socket(Receiver);

  Sockets.Set_Socket_Option(Receiver, Option => (
  	Name    => Sockets.Reuse_Address,
	Enabled => True));

  Sockets.Bind_Socket (Receiver, (
	Family => Sockets.Family_Inet,
	Addr   => Sockets.Inet_Addr (IP),
	Port   => PORT));

  Sockets.Listen_Socket (Receiver);

  Put_Line("Server started: " & IP & ":" & Port'Img);

  loop
       Sockets.Accept_Socket (
         Server  => Receiver,
         Socket  => Connection,
         Address => Client,
         Timeout => 30.0,
         Status  => Status
       );

      declare
         New_Client : Client_Type;
	 Stream     : Sockets.Stream_Access;
      begin
         Stream := Sockets.Stream (Connection);
         New_Client.Set_Stream( Stream );
         --Clients.Append( New_Client'Access );

	 Put_Line ( Sockets.Image (Client) & " connected.");
	 String'Output ( Stream, "[Server] Connection successful!");
      end;

  end loop;



 exception
     when Sockets.Socket_Error =>
        Put_Line ("Port is unavailable.");
     when others =>
        Put_Line("Unkonw error occured");

 end Start;




 task body Client_Type is
      Stream : Sockets.Stream_Access;
   begin
     loop

      accept Set_Stream (S : in Sockets.Stream_Access) do
	Stream := S;
      end Set_Stream;


      accept Write (Message : in String) do
	 String'Output ( Stream, Message );
      end Write;


      accept Read (Message : out String) do
	 Message := String'Input ( Stream );
      end Read;

     end loop;
   end Client_Type;




end TCP.Server;
