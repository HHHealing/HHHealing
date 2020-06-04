import ddf.minim.*;

PImage img;
Minim minim;
AudioPlayer song1, song2;

Setting set = new Setting();

void setup() {
  minim = new Minim(this);
  int disW = displayWidth/2;
  int disH = displayHeight/2;
  background(0);
  img = loadImage("fire.jpg");
  song1 = minim.loadFile("fire_music.mp3");
  song2 = minim.loadFile("yume.mp3");
  surface.setResizable(false);
  surface.setSize(disW, disH);
  
  //song1.loop(); // 작업하는데 소리가 계속 들려서 잠시 꺼둠
  //song2.loop();
}

void draw() {
  image(img, 0, 0, displayWidth/3, displayHeight/2);
  set.btn();
}

void stop() {
  song1.close();
  song2.close();
  minim.stop();
  super.stop();
}
