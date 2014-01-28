#include "Server.h"

Server::Server() {}

void Server::run(int port) {
	int socketDescriptor = socket(PF_INET, SOCK_STREAM, 0);
	if (socketDescriptor < 0) {
		std::cout << "Creating a socket failed." << std::endl;
		return;
	}
	std::cout << "Socket descriptor is: " << socketDescriptor << std::endl;
	struct sockaddr_in name;
	name.sin_family = AF_INET;
	name.sin_port = htons(port);
	name.sin_addr.s_addr = htonl(INADDR_ANY );
	if (bind(socketDescriptor, (struct sockaddr *) &name, sizeof(name)) < 0) {
		std::cout << "Could not bind a name to the socket." << std::endl;
		return;
	}
	if (listen(socketDescriptor, 1) < 0) {
		std::cout << "Could not listen for connections." << std::endl;
		return;
	}
	fd_set activeFdSet;
	fd_set readFdSet;
	FD_ZERO(&activeFdSet);
	FD_SET(socketDescriptor, &activeFdSet);
	struct sockaddr_in clientName;
	int clientSocket;
	unsigned int size;
	while (1) {
		readFdSet = activeFdSet;
		if (select(FD_SETSIZE, &readFdSet, NULL, NULL, NULL) < 0) {
			std::cout << "select failed." << std::endl;
		}
		for (int i = 0; i < FD_SETSIZE; ++i) {
			if (FD_ISSET(i, &readFdSet)) {
				if (i == socketDescriptor) {
					size = sizeof(clientName);
					clientSocket = accept(socketDescriptor, (struct sockaddr *) &clientName, &size);
					if (clientSocket < 0) {
						std::cout << "Could not accept connection" << std::endl;
					}
					FD_SET(clientSocket, &activeFdSet);
					onClientConnected(clientSocket);
				}else{
					char cmessage[32];
					int bytes = read(i, cmessage, 32);
					if (bytes == -1) {
						std::cout << "Reading data from client " << i << " failed." << std::endl;
					} else if (bytes == 0) {
						close(i);
						FD_CLR(i, &activeFdSet);
						onClientDisconnected(i);
					} else {
						std::string message(cmessage, bytes);
						onClientMessage(i,message);
					}
				}
			}
		}
	}
}


void Server::write(int socketDescriptor, std::string message){
	int bytes = ::write(socketDescriptor, message.c_str(), message.length());
	if (bytes < 0) {
		std::cout << "Error: write to socket " << socketDescriptor << " failed." << std::endl;
	}
}









