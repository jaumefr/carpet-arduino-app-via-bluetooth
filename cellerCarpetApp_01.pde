import processing.serial.*;

// The serial port:
Serial myPort;       

void setup(){
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);  
  frameRate(20);
}

void draw(){
  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();   
    if (inBuffer != null) {
      print(inBuffer);
    }
  }
}
