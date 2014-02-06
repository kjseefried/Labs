with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with GNAT.Sockets;
with Ada.Containers.Doubly_Linked_Lists;


use Ada.Text_IO;
use GNAT;
use Ada.Containers;
use type GNAT.Sockets.Stream_Access;

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

 package channelList is new Doubly_Linked_Lists(Sockets.Stream_Access);
   use channelList;
   channels : channelList.List;


end TCP.Server;
