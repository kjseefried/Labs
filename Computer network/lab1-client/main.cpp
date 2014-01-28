#include <iostream>
#include "Client.h"

class MyClient : public Client{
	void onServerMessage(std::string message){
		std::cout << message << std::endl;
	}
	void onServerConnection(){
		std::cout << "[connection established]" << std::endl;
	}
};


int main(int argc, char** argv) {
	char* hostName = argv[1];
	int port = atoi(argv[2]);
	MyClient client;
	client.run(hostName,port);
	
	std::string message;
	while(true){
		std::getline(std::cin, message);
		client.write(message);
	};
}