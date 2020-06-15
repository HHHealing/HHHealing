import ddf.minim.*; // test

PImage img;
Minim minim;
AudioPlayer song1, song2;
public static ControlP5 slider; 
int i;
boolean Check = false;
int mx, my;

Setting set = new Setting(); // 옵션창 객체 생성
Effect ef = new Effect();
memo memo = new memo();

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
  ef.ImgSet();
  
  
  //song1.loop(); // 작업하는데 소리가 계속 들려서 잠시 꺼둠
  //song2.loop();
}

void draw() {  
  
  song1.setGain(set.getHs1Volume()* 0.86 - 80);
  song2.setGain(set.getHs2Volume()* 0.86 - 80);
  image(img, 0, 0, displayWidth/3, displayHeight/2);
  set.btn();

  if(mousePressed){
    mx = mouseX;
    my = mouseY;
    i = 0;
  }
  if(!set.CheckOption() && mx <= displayWidth/3){
    ef.drawImage(mx, my, i); 
  }
  i ++;
  
  memo.set();
  
}



void stop() {
  song1.close();
  song2.close();
  minim.stop();
  super.stop();
}
