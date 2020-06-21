class Diary {
  PImage img;
  int size = 100;
  int x = 300;
  int y = 400;
  boolean CheckDiary = false;
  String word;
  ArrayList<String> S;
  PrintWriter output;

  void s() {
    
    S = new ArrayList<String>(); 
    img = loadImage("diaryImage.png");
    img.resize(0, size);
  }

  void set() {

    image(img, displayWidth/3, 0, size, size);
    check();
  }
  void drawDiary() {
    fill(255);
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);
    fill(0);   
    textAlign(CENTER, TOP);
    text(year() +"."  + month() + "." + day(), displayWidth/4, displayHeight/4 -y/2);
    WD();
  }
  void check() {
    if (mouseX>=displayWidth/3 && mouseX <= displayWidth/3+size && 
      mouseY>= 0 && mouseY<= size && mousePressed && !CheckDiary ) {
      CheckDiary = true;
    } else if (CheckDiary) {
      if (mousePressed && !(mouseX >= displayWidth/4 - x/2 && 
        mouseX <= displayWidth/4 - x/2 + x && mouseY >= displayHeight/4 - y/2 &&
        mouseY <= displayHeight/4 - y/2 + y)) {
        CheckDiary = false;
      } else {
        drawDiary();
      }
    }
  }
  void writeDiary() {
    word = "";
    if (key == BACKSPACE) {
      if(S.size() != 0){
        S.remove(S.size()-1);
      }
    }
    else {
      S.add(key + "");
    }
    for (int i = 0; i < S.size(); i++) {
      word +=  S.get(i);
    }
    textSize(20);
    textAlign(LEFT);
    text(word, displayWidth/4 - x/2+ 10, displayHeight/4 - y/2 + 50);
    output = createWriter(year() + "." + month() +  "." + day() + "." + hour() + ".txt"); 
    output.print(word);
    output.flush();
  }
  boolean getCheckDiary() {
    return CheckDiary;
  }
  void WD() {
    word = "";
    for (int i = 0; i < S.size(); i++) {
      word +=  S.get(i);
    }
    textSize(20);
    textAlign(LEFT);
    text(word, displayWidth/4 - x/2 + 10, displayHeight/4 - y/2 + 50);
  }
}
