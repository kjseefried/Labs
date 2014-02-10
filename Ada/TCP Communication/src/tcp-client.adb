package body TCP.Client is

 -------------
 -- Connect --
 -------------

 procedure Connect is
 begin
  Put_Line("Connecting to " & IP &":"& PORT'Img);
  Sockets.Initialize;
  Sockets.Create_Socket (Socket);
  Address.Addr := Sockets.Inet_Addr (IP);
  Address.Port := PORT;
  Sockets.Connect_Socket (Socket, Address);
  Channel := Sockets.Stream (Socket);

  -- Initialize writer and reader tasks
  declare
     rt : Reader_Tast;
     wt : Writer_Task;
  begin
     null;
  end;

 Exception
    when SOCKETS.SOCKET_ERROR =>
       Put_Line ("[ERROR] Unable to connect to server.");
       Press_Any_Key_To_Exit;
    when others =>
       Put_Line ("[ERROR] Unknown error occurred.");
       Press_Any_Key_To_Exit;

 end Connect;

 -------------------
 --  Writer_Task  --
 -------------------

 task body Writer_Task is
    Message       : String (1 .. 128);
    MessageLength : Natural;
 begin
  loop
     Get_Line (Message, MessageLength);
     String'Output(Channel, Message (Message'First .. MessageLength));
  end loop;
 end Writer_Task;



 -----------------
 -- Reader_Task --
 -----------------

 task body Reader_Tast is
 begin
  loop
     Put_Line( String'Input (Channel));
  end loop;
 end Reader_Tast;



 ---------------------------
 -- Press_Any_Key_To_Exit --
 ---------------------------

 procedure Press_Any_Key_To_Exit is
    ch : Character;
 begin
    Put_Line ("Press any key to exit...");
    Get_Immediate (ch);
 end Press_Any_Key_To_Exit;

end TCP.Client;
