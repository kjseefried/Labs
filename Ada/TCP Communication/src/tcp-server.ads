with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with GNAT.Sockets;
with Ada.Containers.Doubly_Linked_Lists;

use GNAT;
use Ada.Text_IO;
use Ada.Containers;
use type GNAT.Sockets.Stream_Access;

generic

   IP   : String;
   Port : Sockets.Port_Type;

package TCP.Server is

   Procedure Start;
   task type Listener_Task;
   task type Writer_Task;
   task type Reader_Task;

   procedure Broadcast( Message : in String; Author : in String := "Server> " );

private

   Receiver: Sockets.Socket_Type;
   package channelList is new Doubly_Linked_Lists( Sockets.Stream_Access );
   use channelList;
   channels : channelList.List;

end TCP.Server;
