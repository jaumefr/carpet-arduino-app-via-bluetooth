
float fast = 50;
int fastTime = 0;
boolean showFastControl = false;

int stepsFast = 0;

String serie = "12345";

int seriePrev = 0;
int serieNext = 1;
int sensor = 0;
int num = 0;

PImage[][] img = new PImage[5][3];

boolean escoltaRight = false;
boolean escoltaWrong = false;

boolean[] rightEstat = new boolean[5];
boolean[] wrongEstat = new boolean[5];

boolean showRight1 = false;
boolean showRight2 = false;
boolean showRight3 = false;
boolean showRight4 = false;
boolean showRight5 = false;

Tag[] tags = new Tag[5];

void setup(){
  size(600,300);
  smooth();
  
  tags[0] = new Tag(0,50,50);
  tags[1] = new Tag(1,110,50);
  tags[2] = new Tag(2,170,50);
  tags[3] = new Tag(3,230,50);
  tags[4] = new Tag(4,290,50);
  
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
 
  background(0);
}

void draw(){
 background(0);
 fill(255);
 textSize(12);
 text(serie,10,15);
 for(int i=0;i<tags.length;i++){
   tags[i].show();
 }
 
 if (keyPressed) {
    if (key == 'b' || key == 'B') {
      showFastControl = true;
      escoltaWrong = false;
       for(int i=0;i<tags.length;i++){
         wrongEstat[i] = false;
       }
    }
    if(escoltaRight){
        if(key == '1'){ rightEstat[0]=true; }
        if(key == '2'){ rightEstat[1]=true; }
        if(key == '3'){ rightEstat[2]=true; }
        if(key == '4'){ rightEstat[3]=true; }
        if(key == '5'){ rightEstat[4]=true; }
    }
    if(escoltaWrong){
        if(key == '1'){ wrongEstat[0]=true; }
        if(key == '2'){ wrongEstat[1]=true; }
        if(key == '3'){ wrongEstat[2]=true; }
        if(key == '4'){ wrongEstat[3]=true; }
        if(key == '5'){ wrongEstat[4]=true; }
    }
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
}


void repassaSerie(){
  if(serieNext < serie.length()+1){
    tags[int(serie.substring(seriePrev,serieNext))-1].showFast();
  }
  else{ showFastControl=false; seriePrev=0; serieNext=1; escoltaRight=true; escoltaWrong=true; }
}