with TCP.Client;

procedure Client is
	Package Test_Client is new TCP.Client ("127.0.0.1", 1100);

begin
	Test_Client.Connect;

end Client;
