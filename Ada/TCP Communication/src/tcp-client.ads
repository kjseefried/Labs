with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with Ada.Calendar;
with GNAT.Sockets;

use Ada.Text_IO;
use GNAT;

generic
   	IP 	: String;
   	Port 	: GNAT.Sockets.Port_Type;

package TCP.Client is
	Procedure Connect;
	procedure Press_Any_Key_To_Exit;
   	task type Writer_Task;
   	task type Reader_Tast;

private
	Socket  : Sockets.Socket_Type;
   	Receiver: GNAT.Sockets.Socket_Type;
   	Channel	: GNAT.Sockets.Stream_Access;
	Address : Sockets.Sock_Addr_Type;

end;
