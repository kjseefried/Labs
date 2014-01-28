#include <sys/socket.h>
#include <sys/types.h>
#include <sys/times.h>
#include <iostream>
#include <netinet/in.h>
#include <unistd.h>

class Server {
public:
	Server();
	virtual void onClientConnected(int socketDescriptor) = 0;
	virtual void onClientMessage(int socketDescriptor, std::string message) = 0;
	virtual void onClientDisconnected(int socketDescriptor) = 0;
	void write(int socketDescriptor, std::string message);
	void run(int port);
};