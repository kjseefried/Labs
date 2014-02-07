with TCP.Server;

procedure server is
	Package mainServer is new TCP.Server ("127.0.0.1", 1100);

begin
	mainServer.start;

end server;
