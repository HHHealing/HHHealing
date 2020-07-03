class Diary {
  PImage img;
  int size = 100;
  int x = 300;
  int y = 400;
  boolean CheckDiary = false;
  String word;
  ArrayList<String> S;
  PrintWriter output;
  int[] RGB;
  void s() {
    
    S = new ArrayList<String>(); 
    img = loadImage("diaryImage.png");
    img.resize(0, size);
  }

  void set() {   
    image(img, 640, 0, size, size);
    check();
  }
  void drawDiary() {
    RGB = set.RGB();
    fill(RGB[0], RGB[1], RGB[2]);   
    rect(480 - x/2,270 - y/2, x, y);
    fill(0);   
    textAlign(CENTER, TOP);
    text(year() +"."  + month() + "." + day(), 480, 270 -y/2);
    WD();
  }
  void check() {
    if (mouseX>=640 && mouseX <= 640+size && 
      mouseY>= 0 && mouseY<= size && mousePressed && !CheckDiary ) {
      CheckDiary = true;
    } else if (CheckDiary) {
      if (mousePressed && !(mouseX >= 480 - x/2 && 
        mouseX <= 480 - x/2 + x && mouseY >= 270 - y/2 &&
        mouseY <= 270 - y/2 + y)) {
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
    text(word, 480 - x/2+ 10, 270 - y/2 + 50);
    output = createWriter("diary/" + year() + "." + month() +  "." + day() + "." + hour() + ".txt"); 
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
    text(word, 480 - x/2 + 10, 270 - y/2 + 50);
  }
}
