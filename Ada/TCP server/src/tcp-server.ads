with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with GNAT.Sockets;
with Ada.Containers.Doubly_Linked_Lists;


use Ada.Text_IO;
use GNAT;

generic
	IP 	: String;
   	PORT 	: Sockets.Port_Type;

package TCP.Server is
  	Procedure Start;
   	task type listenerTask;
  	task type writerTask;
   	task type readerTask;

private
   	Receiver: Sockets.Socket_Type;
   	channel	: Sockets.Stream_Access;

	--type chType is array( Positive range <>) of Sockets.Stream_Access;
	--channels : chType(1..10);


end TCP.Server;
