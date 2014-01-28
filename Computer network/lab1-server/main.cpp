#include "Server.h"
#include <stdlib.h>
#include <set>
#include <sstream>

class MyServer : public Server{
	
	std::set<int> clients;

	void onClientConnected(int socketDescriptor){
		clients.insert(socketDescriptor);
		std::stringstream messagestream;
		messagestream << "[connected "<< socketDescriptor << "]" << std::endl;
		messagestream << "[online "<< clients.size() << "]";
		std::string message = messagestream.str();
		std::cout << message << std::endl;
		broadcast(message);
	}

	
	void onClientDisconnected(int socketDescriptor){
		clients.erase(socketDescriptor);
		std::stringstream messagestream;
		messagestream << "[disconnected "<< socketDescriptor << "]" << std::endl;
		messagestream << "[online "<< clients.size() << "]";
		std::string message = messagestream.str();
		std::cout << message << std::endl;
		broadcast(message);
	}
	
	
	void onClientMessage(int socketDescriptor, std::string clientMessage){
		std::stringstream messagestream;
		messagestream << "[client "<< socketDescriptor << "] " << clientMessage;
		std::cout << "[broadcast] " << clientMessage << std::endl;
		broadcast(messagestream.str());
	}

	
	void broadcast(std::string message){
		for(std::set<int>::iterator client = clients.begin(); client != clients.end(); ++client){
			write(*client,message);
		}
	}
	
	
};

int main(int argc, char *argv[]) {
	int port = atoi(argv[1]);
	MyServer server;
	server.run(port);
	return 0;
}
