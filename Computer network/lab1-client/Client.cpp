#include "Client.h"

Client::Client(){}

void Client::watchServer(){
	while(1){
		char cmessage[32];
		int bytes = read(socketDescriptor, cmessage, 32);
		if(bytes > 0){
			std::string message(cmessage, bytes);
			onServerMessage(message);
		}
		std::this_thread::sleep_for(std::chrono::microseconds(1));
	}
}


void Client::run(char* hostName,int port){
	socketDescriptor = socket(PF_INET, SOCK_STREAM, 0);
	if (socketDescriptor < 0) {
		std::cout << "Error: Creating a socket failed" << std::endl;
		return;
	}
	struct sockaddr_in serverName;
	serverName.sin_family = AF_INET;
	serverName.sin_port = htons(port);
	struct hostent *hostInfo = gethostbyname(hostName);
	if (hostInfo == NULL) {
		std::cout << "Error: Unknown host: " << hostName << std::endl;
		return;
	}
	serverName.sin_addr = *(struct in_addr *) hostInfo->h_addr;
	if (connect(socketDescriptor, (struct sockaddr *) &serverName, sizeof(serverName)) < 0) {
		std::cout << "Error: Connecting to: " << hostName << "::" << port << " failed" << std::endl;
		return;
	}
	onServerConnection();
	std::thread (&Client::watchServer,this).detach();
}



void Client::write(std::string message){
	int bytes = ::write(socketDescriptor,message.c_str(),message.length());
	if(bytes < 0){
		std::cout << "Error: write failed." << std::endl;
	}
}







