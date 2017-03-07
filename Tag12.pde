class Tag11{
  int num, x, y, a;
  
  Tag11(int numTag, int coordX, int coordY){
    num = numTag;
    x = coordX;
    y = coordY;
  }
  
  void show(){
    image(img[num][0],x,y); 
  }
  
  void showFast(){
    fastTime = fastTime+1;
    if(fastTime<fast){;
      a = a+2;
      tint(255,a);
      image(img[num][1],x,y); 
      noTint();
    }
    else{ fastTime=0; seriePrev=seriePrev+1; serieNext=serieNext+1; a=0;}
  }
  
  void right(){
    fastTime = fastTime+1;
    if(fastTime<fast){
      image(img[num][1],x,y);        
    }
    else{ fastTime=0; rightEstat[num]=false;}
  }
  
  void wrong(){
    if(escoltaWrong){
      image(img[num][3],x,y);        
    }
    else{ image(img[num][0],x,y); }
  }
  
  boolean manual(){
    if(mouseX>x+(width/2)&&mouseX<x+50+(width/2)&&mouseY>y-50&&mouseY<y+50-50){
      return true;
    }
    else{
      return false;
    }
    
  }

}