import processing.serial.*;

Serial myPort;   
String sensor = "";
String sensor1 = "";
String missatge= "";
String missatge2= "";
int colorRedMiss = 255; 
int colorGreenMiss = 255;
int colorBlueMiss = 255;
int cosMissatge= 12;

float fast = 300;
int fastTime = 0;
boolean showFastControl = false;

int stepsFast = 0;

String serie = "";
int longSerie = 0;
int min = 0;
int max = 1;

int seriePrev = 0;
int serieNext = 1;
//int sensor = 0;
int num = 0;

PImage[][] img = new PImage[5][4];

boolean escoltaRight = false;
boolean escoltaWrong = false;

boolean[] rightEstat = new boolean[5];
boolean[] wrongEstat = new boolean[5];

boolean showRight1 = false;
boolean showRight2 = false;
boolean showRight3 = false;
boolean showRight4 = false;
boolean showRight5 = false;

Tag11[] tags = new Tag11[5];

void setup(){
  size(600,600);
  smooth();
  
  // List all the available serial ports
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);  
  println("------------");
  println("LECTURA SENSORS:");
  
  tags[0] = new Tag11(0,-25,100);
  tags[1] = new Tag11(1,-25,250);
  tags[2] = new Tag11(2,100,400);
  tags[3] = new Tag11(3,-150,400);
  tags[4] = new Tag11(4,100,550);
  
  rightEstat[0] = false;
  rightEstat[1] = false;
  rightEstat[2] = false;
  rightEstat[3] = false;
  rightEstat[4] = false;
  
  wrongEstat[0] = false;
  wrongEstat[1] = false;
  wrongEstat[2] = false;
  wrongEstat[3] = false;
  wrongEstat[4] = false;
  
  img[0][0] = loadImage("1.png");
  img[0][1] = loadImage("1ok.png");
  img[0][2] = loadImage("1no.png");
  img[0][3] = loadImage("1bo.png");
  img[1][0] = loadImage("2.png");
  img[1][1] = loadImage("2ok.png");
  img[1][2] = loadImage("2no.png");
  img[1][3] = loadImage("2bo.png");
  img[2][0] = loadImage("3.png");
  img[2][1] = loadImage("3ok.png");
  img[2][2] = loadImage("3no.png");
  img[2][3] = loadImage("3bo.png");
  img[3][0] = loadImage("4.png");
  img[3][1] = loadImage("4ok.png");
  img[3][2] = loadImage("4no.png");
  img[3][3] = loadImage("3bo.png");
  img[4][0] = loadImage("5.png");
  img[4][1] = loadImage("5ok.png");
  img[4][2] = loadImage("5no.png");
  img[3][3] = loadImage("3bo.png");
 
  background(0);
  novaSerie();
  showFastControl = true;
}

void draw(){
 background(0);
 //fill(255);
 //textSize(12);
 //text(serie,10,25);
 translate(width/2,-50);
 for(int i=0;i<tags.length;i++){
   tags[i].show();
 }
 
  while (myPort.available() > 0) {
    sensor = myPort.readString(); 
    sensor1 = sensor.substring(0, 1);
    if (sensor != "") {
      println(sensor1);
    }
    compara();
  }
  if(showFastControl){ repassaSerie(); }
  
  if(rightEstat[0]){ tags[0].right(); }  
  if(rightEstat[1]){ tags[1].right(); }  
  if(rightEstat[2]){ tags[2].right(); } 
  if(rightEstat[3]){ tags[3].right(); } 
  if(rightEstat[4]){ tags[4].right(); } 
  
  if(wrongEstat[0]){ tags[0].wrong(); }  
  if(wrongEstat[1]){ tags[1].wrong(); }  
  if(wrongEstat[2]){ tags[2].wrong(); } 
  if(wrongEstat[3]){ tags[3].wrong(); } 
  if(wrongEstat[4]){ tags[4].wrong(); } 
  
  fill(0);
  rect((width/2)*-1,0,width,90);
  fill(200);
  textSize(12);
  missatge = serie;
  text("long: "+str(longSerie)+"  min:"+str(min)+"  max:"+str(max)+"  serie:"+missatge+"  ara espera:"+serie.substring(min,max),(-1*(width/2)+10),62);
  fill(colorRedMiss,colorGreenMiss,colorBlueMiss);
  textSize(20);
  text(missatge2,(-1*(width/2)+10),84);  
}

void repassaSerie(){
  if(serieNext < serie.length()+1){
    tags[int(serie.substring(seriePrev,serieNext))-1].showFast();
  }
  else{ showFastControl=false; seriePrev=0; serieNext=1; escoltaRight=true; escoltaWrong=true; }
}

void novaSerie(){
  serie = serie + str(floor(random(1,6)));
  longSerie = longSerie + 1; 
}

void compara(){
      println("sensor1: "+sensor1);
      if(sensor1.equals(serie.substring(min,max))){
        wrongEstat[int(serie.substring(min,max))-1]=true;
        colorRedMiss = 0; colorGreenMiss = 255; colorBlueMiss = 0;
        missatge2 = "OK! esperava "+serie.substring(min,max)+" i has picat al "+sensor1;
        if(max==longSerie){
          min = 0;
          max = 1;
          colorRedMiss = 0; colorGreenMiss = 255; colorBlueMiss = 0;
          missatge2 = "SERIE COMPLETADA! amplia serie!";
          reset();
          novaSerie();
          seriePrev=0; serieNext=1;
          showFastControl = true;
        }
        else{
           min = min+1;
           max = max+1;          
        }
      }
      else{
        colorRedMiss = 255; colorGreenMiss = 0; colorBlueMiss = 0;
        missatge2 = "ERROR! esperava "+serie.substring(min,max)+" i has picat al "+sensor1;
        serie = "";
        longSerie = 0;
        reset();
        novaSerie();
        seriePrev=0; serieNext=1;
        showFastControl = true;
        min = 0;
        max = 1;
      }
}

void reset(){
  for(int i=0; i<5; i++){
    rightEstat[i] = false; 
    wrongEstat[i] = false;  
  }
}