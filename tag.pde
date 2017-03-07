class Tag{
  int num, x, y;
  
  Tag(int numTag, int coordX, int coordY){
    num = numTag;
    x = coordX;
    y = coordY;
  }
  
  void show(){
    image(img[num][0],x,y); 
  }
  
  void showFast(){
    fastTime = fastTime+1;
    if(fastTime<fast){
      image(img[num][1],x,y);        
    }
    else{ fastTime=0; seriePrev=seriePrev+1; serieNext=serieNext+1; }
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
      image(img[num][2],x,y);        
    }
    else{ image(img[num][0],x,y); }
  }

}