#include <stdlib.h>
#include <string.h>
#include <unistd.h> //read()
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <iostream>
#include <thread>
#include <chrono>

class Client{
public:
	Client();
	void run(char* host,int port);
	virtual void onServerMessage(std::string message) = 0;
	virtual void onServerConnection() = 0;
	void write(std::string message);
private:
	int socketDescriptor;
	void watchServer();
};