with TCP.Server;

procedure server is

begin
	TCP.Server.Start("127.0.0.1", 1100);

end server;
