with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.streams;
with GNAT.Sockets;
with Ada.Containers.Doubly_Linked_Lists;

use Ada.Text_IO;
use GNAT;
use Ada.Containers;
use type GNAT.Sockets.Stream_Access;

package TCP.Server is

   procedure Start( IP : in String; Port : in Sockets.Port_Type );

   type Client_Type;
   type Client_Access is access all Client_Type;
   task type Client_Type is
      entry Set_Stream( S : in Sockets.Stream_Access );
      entry Read( Message : out String );
      entry Write( Message : in String );
   end Client_Type;


   package Channel_List_Type is new Doubly_Linked_Lists( Client_Type );
   use Channel_List_Type;

   Clients : Channel_List_Type.List;

end TCP.Server;
