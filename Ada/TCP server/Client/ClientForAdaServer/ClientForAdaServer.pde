  
import processing.net.*; 
Client myClient;  
String fromServer; 

void setup() { 
  size(200, 200); 
  myClient = new Client(this, "127.0.0.1", 5204); //Same port and IP as Server
} 
 
void draw() { 
  if (myClient.available() > 0) { 
    fromServer = myClient.readString(); 
    println(fromServer);
  }
} 
