class Effect {
  PImage[] images = new PImage[12];
  int i = 0;
  int time;
  PImage img;

  void ImgSet() {
    images[0]  = loadImage("fire3-0000.png");
    images[1]  = loadImage("fire3-0001.png");
    images[2]  = loadImage("fire3-0002.png");
    images[3]  = loadImage("fire3-0003.png"); 
    images[4]  = loadImage("fire3-0004.png");
    images[5]  = loadImage("fire3-0005.png"); 
    images[6]  = loadImage("fire3-0006.png");
    images[7]  = loadImage("fire3-0007.png"); 
    images[8]  = loadImage("fire3-0008.png");
    images[9]  = loadImage("fire3-0009.png"); 
    images[10] = loadImage("fire3-0010.png");
    images[11] = loadImage("fire3-0011.png");

    img = loadImage("fire.jpg");
  }

  void drawImage(int x, int y, int i) {
    if (millis() >= time + 1000/12) {
      time = millis();
      i ++;
    }
    if (i< 12) {
      image(images[i], x - 35, y - 35, 70, 70);
    } else {
      //image(img, 0, 0, displayWidth/3, displayHeight/2);
    }
  }
}
