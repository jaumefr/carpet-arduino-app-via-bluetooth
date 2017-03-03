import processing.serial.*;

// The serial port:
Serial myPort;   
String sensor = "";
String sensor1 = "";
String missatge= "";

int x1=-25;
int y1=100;
int x2=-25;
int y2=250;
int x3=100;
int y3=400;
int x4=-150;
int y4=400;
int x5=100;
int y5=550;

void setup(){
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[1], 9600);  
  println("------------");
  println("LECTURA SENSORS:");
  frameRate(20);
  fill(255,0,0);
  size(600,600);
  background(0);
}

void draw(){
  fill(60,10);
  textSize(30);
  translate(width/2,0);
  rect(x1,y1,50,50);
  rect(x2,y2,50,50);
  rect(x3,y3,50,50);
  rect(x4,y4,50,50);
  rect(x5,y5,50,50);
  
  while (myPort.available() > 0) {
    sensor = myPort.readString(); 
    sensor1 = sensor.substring(0, 1);
    if (sensor != null) {
      println(sensor);
      if(sensor1.equals("1")){ 
        missatge = "sensor 1";
        fill(255);
        rect(x1,y1,50,50);
        fill(0);
        text(sensor1, x1+15, y1+35);
        delay(100);
      }
      if(sensor1.equals("2")){ 
        missatge = "sensor 2";
        fill(255);
        rect(x2,y2,50,50);
        fill(0);
        text(sensor1, x2+15, y2+35);
      }
      if(sensor1.equals("3")){ 
        missatge = "sensor 3";
        fill(255);
        rect(x3,y3,50,50);
        fill(0);
        text(sensor1, x3+15, y3+35);
      }
      if(sensor1.equals("4")){ 
        missatge = "sensor 4";
        fill(255);
        rect(x4,y4,50,50);
        fill(0);
        text(sensor1, x4+15, y4+35);
      }
      if(sensor1.equals("5")){ 
        missatge = "sensor 5";
        fill(255);
        rect(x5,y5,50,50);
        fill(0);
        text(sensor1, x5+15, y5+35);
      }
    }
  }
}
