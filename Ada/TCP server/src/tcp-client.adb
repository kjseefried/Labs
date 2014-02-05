package body TCP.Client is

 -------------
 -- Connect --
 -------------

 procedure Connect is
 begin
  New_Line (100);
  Put_Line("Connecting to " & IP &":"& PORT'Img);
  Sockets.Initialize;
  Sockets.Create_Socket (Socket);
  Address.Addr := Sockets.Inet_Addr (IP);
  Address.Port := PORT;
  Sockets.Connect_Socket (Socket, Address);
  Channel := Sockets.Stream (Socket);
  delay 1.0;
  Put_Line ("[CONNECTED]");

  -- Initialize writer and reader tasks
  declare
   rt : readerTask;
   wt : writerTask;
  begin
   null;
  end;

 Exception
  when SOCKETS.SOCKET_ERROR =>
   Put_Line ("[ERROR] Unable to connect to server.");
   pressAnyKeyToExit;
  when others =>
   Put_Line ("[ERROR] Unknown error occurred.");
   pressAnyKeyToExit;

 end Connect;

 ------------------
 --  writerTask   --
 ------------------

 task body writerTask is
  Message       : String (1 .. 128);
  MessageLength : Natural;
 begin
  loop
   Put ("> ");
   Flush;
   Get_Line (Message, MessageLength);
   String'Output (Channel, Message (Message'First .. MessageLength));
  end loop;
 end writerTask;



 ----------------
 -- readerTask --
 ----------------

 task body readerTask is
 begin
  loop
   Put_Line ("> " & String'Input (Channel));
  end loop;
 end readerTask;



 -----------------------
 -- pressAnyKeyToExit --
 -----------------------

 procedure pressAnyKeyToExit is
  ch : Character;
 begin
  Put_Line ("Press any key to exit...");
  Get_Immediate (ch);
 end pressAnykeyToExit;

end TCP.Client;
