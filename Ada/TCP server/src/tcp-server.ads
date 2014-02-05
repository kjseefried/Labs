with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with GNAT.Sockets;

use Ada.Text_IO;
use GNAT;

generic
	IP 	: String;
   	PORT 	: GNAT.Sockets.Port_Type;

package TCP.Server is
  	Procedure Start;
   	task type listenerTask;
  	task type writerTask;
   	task type readerTask;

private
   	Receiver: GNAT.Sockets.Socket_Type;
   	channel	: GNAT.Sockets.Stream_Access;

end TCP.Server;
