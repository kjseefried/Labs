with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with Ada.Calendar;
with GNAT.Sockets;

use Ada.Text_IO;
use GNAT;

generic
   	IP 	: String;
   	PORT 	: GNAT.Sockets.Port_Type;

package TCP.Client is
	Procedure Connect;
	procedure pressAnyKeyToExit;
   	task type writerTask;
   	task type readerTask;

private
	Socket  : Sockets.Socket_Type;
   	Receiver: GNAT.Sockets.Socket_Type;
   	channel	: GNAT.Sockets.Stream_Access;
	Address : Sockets.Sock_Addr_Type;

end;
