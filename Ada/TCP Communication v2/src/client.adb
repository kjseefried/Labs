with TCP.Client;

procedure Client is
	Package mainClient is new TCP.Client ("127.0.0.1", 1100);

begin
	mainClient.Connect;

end Client;
