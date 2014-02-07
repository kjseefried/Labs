with TCP.Server;

procedure server is
	Package Main_Server is new TCP.Server ("127.0.0.1", 1100);

begin
	Main_Server.start;

end server;
