class HScrollbar {
  int swidth, sheight;   
  float xpos, ypos;       
  float spos, newspos;    
  float sposMin, sposMax; 
  int loose;              
  boolean over;          
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l, int w) { // w: 현재 볼륨의 위치
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + w - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      spos = mouseX;
      //constrain(mouseX-sheight/2, sposMin, sposMax);
    }
  }



  boolean overEvent() {
    if (mouseX > xpos - (sheight/2) - 2 && mouseX < xpos+swidth - (sheight/2) + 1 &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos1() {
    return sheight/2 - xpos + spos;
    //((spos - xpos) * (100.0/84.0));
  }
  
  float getPos2() {
    return sheight/2 - xpos + spos;
    //((spos - xpos) * (100.0/84.0));
  }
  
  float getR(){
     return  sheight/2 - xpos + spos;
  }
  
  float getG(){
     return  sheight/2 - xpos + spos;
  }
  
  float getB(){
     return  sheight/2 - xpos + spos;
  }
}
