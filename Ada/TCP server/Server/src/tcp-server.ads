with Ada.Text_IO;
with Ada.IO_Exceptions;
with GNAT.Sockets;
with Ada.streams;
with Ada.Calendar;

generic
   IP0 : String := "127.0.0.1";
   PORT0 : GNAT.Sockets.Port_Type := 5204;

package TCP.Server is

   --Server information
   type ClientArray is array(1..10) of Gnat.Sockets.Socket_Type;
   type infoType is     --make private
      record
	 IP        : String(1..9) := IP0;
	 Port      : Gnat.Sockets.Port_Type := PORT0;
	 Clients   : Natural := 0;
	 StartTime : Ada.Calendar.Time := Ada.Calendar.Clock;
      end record;
   info : infoType ;

   --Main Operations
   Procedure Start;
   Procedure Stop;
   Procedure Restart;

   --Clients
   Procedure searchForClients;
   Procedure BeginStreaming;
   Procedure Write (String0 : String);

   --Printing
   Procedure printInfo;
   Procedure printClients;

private
   Receiver   : GNAT.Sockets.Socket_Type;
   Connection : GNAT.Sockets.Socket_Type;
   Client     : GNAT.Sockets.Sock_Addr_Type;
   Channel    : GNAT.Sockets.Stream_Access;




end TCP.Server;
