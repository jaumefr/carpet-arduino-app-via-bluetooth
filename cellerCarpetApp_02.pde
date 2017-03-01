import processing.serial.*;

// The serial port:
Serial myPort;   
String sensor = "";
String sensor1 = "";
String missatge= "";

void setup(){
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);  
  println("------------");
  println("LECTURA SENSORS:");
  frameRate(20);
  fill(255,0,0);
  size(300,300);
}

void draw(){
  background(0);
  fill(255,0,0);
  textSize(30);
  text(sensor1, 10, 30);
  while (myPort.available() > 0) {
    sensor = myPort.readString(); 
    sensor1 = sensor.substring(0, 1);
    if (sensor != null) {
      println(sensor);
      if(sensor1.equals("1")){ 
        missatge = "sensor 1";
      }
      if(sensor1.equals("2")){ 
        missatge = "sensor 2";
      }
      if(sensor1.equals("3")){ 
        missatge = "sensor 3";
      }
      if(sensor1.equals("4")){ 
        missatge = "sensor 4";
      }
      if(sensor1.equals("5")){ 
        missatge = "sensor 5";
      }
    }
  }
}

