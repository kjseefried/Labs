package body TCP.Server is


   Procedure start is
   begin
      Ada.Text_IO.Put_Line ("Starting Server...");
      GNAT.Sockets.Create_Socket (Socket => Receiver);
      GNAT.Sockets.Set_Socket_Option
        (Socket => Receiver,
         Option => (Name    => GNAT.Sockets.Reuse_Address, Enabled => True));
      GNAT.Sockets.Bind_Socket
        (Socket  => Receiver,
         Address => (Family => GNAT.Sockets.Family_Inet,
                     Addr   => GNAT.Sockets.Inet_Addr (info.IP),
                     Port   => info.Port));
      GNAT.Sockets.Listen_Socket (Socket => Receiver);
      Ada.Text_IO.Put_Line ("Server started: " & info.IP & ":" & info.Port'Img);

   exception
      when Gnat.Sockets.Socket_Error =>
         info.Port := Gnat.Sockets.Port_Type (Integer (info.Port)+1);
         Start; --Try another port if port is already taken:

   end start;



   Procedure stop is begin
      GNAT.Sockets.Close_Socket (Connection);
      Ada.Text_IO.Put_Line (info.IP & ":" & info.PORT'Img & " server stopped.");
   end stop;


   Procedure restart is begin
      stop;
      start;
   end restart;


   Procedure searchForClients is begin
      GNAT.Sockets.Accept_Socket
        (Server  => Receiver, Socket => Connection, Address => Client);
      Ada.Text_IO.Put_Line ("Client connected from " & GNAT.Sockets.Image (Client));
      info.Clients := info.Clients +1;
      PrintInfo;
      --Write("Welcome to "&IP&":"&PORT'Img);
   end searchForClients;


   Procedure Write (String0 : String) is begin
      String'Output (Channel, String0);
   end Write;


   Procedure BeginStreaming is begin
      Channel := GNAT.Sockets.Stream (Connection);
   end BeginStreaming;

   Procedure PrintInfo is begin
      Ada.Text_IO.Put_Line(info.IP &":"& info.Port'Img &
                             "  |  Clients:"& info.Clients'Img  &
                             "  |  Started: "& Ada.Calendar.Seconds(info.StartTime)'img);

   end PrintInfo;

   Procedure PrintClients is begin
      Ada.Text_IO.Put_Line("Clients list");
   end PrintClients;

end TCP.Server;
