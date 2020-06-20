class Diary {
  PImage img;
  int size = 100;
  int x = 300;
  int y = 400;
  boolean CheckDiary = false;

  void set() {
    img = loadImage("diaryImage.png");
    img.resize(0, size);
    image(img, displayWidth/3, 0, size, size);
    check();
  }
  void drawDiary() {
    fill(255);
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);
  }
  void check() {
    if (mouseX>=displayWidth/3 && mouseX <= displayWidth/3+size && 
      mouseY>= 0 && mouseY<= size && mousePressed && !CheckDiary ) {
      CheckDiary = true;
    }
    else if (CheckDiary) {
      if (mousePressed && !(mouseX >= displayWidth/4 - x/2 && 
        mouseX <= displayWidth/4 - x/2 + x && mouseY >= displayHeight/4 - y/2 &&
        mouseY <= displayHeight/4 - y/2 + y)) {
        CheckDiary = false;
      } 
      else {
        drawDiary();
      }
    }
  }
}
