
PImage img1, img1ok, img1no;
PImage img2, img2ok, img2no;

float fast = 50;
int fastTime = 0;
boolean showFastControl = false;
//boolean fastControl0 = false;
//boolean fastControl1 = false;

int stepsFast = 0;

String serie = "123454213";
int seriePrev = 0;
int serieNext = 1;

PImage[][] img = new PImage[5][3];
boolean[] imgEstat = new boolean[5];
int[][] coord = new int[5][2];

void setup(){
  size(600,300);
  smooth();
  
  img[0][0] = loadImage("1.png");
  img[0][1] = loadImage("1ok.png");
  img[0][2] = loadImage("1no.png");
  img[1][0] = loadImage("2.png");
  img[1][1] = loadImage("2ok.png");
  img[1][2] = loadImage("2no.png");
  img[2][0] = loadImage("3.png");
  img[2][1] = loadImage("3ok.png");
  img[2][2] = loadImage("3no.png");
  img[3][0] = loadImage("4.png");
  img[3][1] = loadImage("4ok.png");
  img[3][2] = loadImage("4no.png");
  img[4][0] = loadImage("5.png");
  img[4][1] = loadImage("5ok.png");
  img[4][2] = loadImage("5no.png");
  
  coord[0][0] = 100;
  coord[0][1] = 50;
  coord[1][0] = 150;
  coord[1][1] = 50;
  coord[2][0] = 200;
  coord[2][1] = 50;
  coord[3][0] = 250;
  coord[3][1] = 50;
  coord[4][0] = 300;
  coord[4][1] = 50;
  
  background(0);
}

void draw(){
 background(0);
 image(img[0][0],100,50);
 image(img[1][0],150,50);
 image(img[2][0],200,50);
 image(img[3][0],250,50);
 image(img[4][0],300,50);
 
  imgEstat[0] = true;
  imgEstat[1] = false;
  imgEstat[2] = true;
  imgEstat[3] = false;
  imgEstat[4] = true;
 
 if (keyPressed) {
    if (key == 'b' || key == 'B') {
      showFastControl = true;
    }
  } 
  if(showFastControl){ repassaSerie(); }
}


void repassaSerie(){
  if(serieNext <= serie.length()){
    showFast2(int(serie.substring(seriePrev,serieNext))-1);
  }
  else{ showFastControl=false; seriePrev=0; serieNext=1; }
}


void showFast2(int numImg){
      fastTime = fastTime+1;
      if(fastTime<fast){
        image(img[numImg][1],coord[numImg][0],coord[numImg][1]);
      }
      else{ fastTime=0; seriePrev=seriePrev+1; serieNext=serieNext+1;}
}