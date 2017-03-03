import processing.serial.*;

// The serial port:
Serial myPort;   
String sensor = "";
String sensor1 = "";
String missatge= "";
String missatge2= "";
String serie = "";
int longSerie = 0;
int min = 0;
int max = 1;

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
  smooth();
  novaSerie();
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
      if(sensor1.equals(serie.substring(min,max))){
        missatge2 = "OK! esperava "+serie.substring(min,max)+" i has picat al "+sensor1;
        if(max==longSerie){
          min = 0;
          max = 1;
          missatge2 = "SERIE COMPLETADA! amplia serie!";
          novaSerie();
        }
        else{
           min = min+1;
           max = max+1;          
        }
      }
      else{
        missatge2 = "ERROR! esperava "+serie.substring(min,max)+" i has picat al "+sensor1;
        serie = "";
        longSerie = 0;
        novaSerie();
        min = 0;
        max = 1;
      }
    }
  }
  fill(0);
  rect((width/2)*-1,0,width,40);
  fill(200);
  textSize(12);
  missatge = serie;
  text("long: "+str(longSerie)+"  min:"+str(min)+"  max:"+str(max)+"  serie:"+missatge+"  ara espera:"+serie.substring(min,max),(-1*(width/2)+10),12);
  text(missatge2,(-1*(width/2)+10),24);
}

void novaSerie(){
  serie = serie + str(floor(random(1,6)));
  longSerie = longSerie + 1; 
}
