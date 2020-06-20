class Diary {
  PImage img;
  int size = 100;

  void set() {
    img = loadImage("diaryImage.png");
    img.resize(0, size);
    int x = 300; // 설정창 x축 크기
    int y = 400; // y
    image(img, displayWidth/3, 0, size, size);
    //print(displayWidth/3 + "  ");
  }
}
