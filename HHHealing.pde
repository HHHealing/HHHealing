import ddf.minim.*; // test
import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

PImage img;
Minim minim;
AudioPlayer song1, song2, song3, song4, song5;
public static ControlP5 slider; 
int i;
boolean Check = false;
int mx, my ;
int a;
boolean CheckMemoDragged = false;
Capture video;
OpenCV opencv;
Rectangle[] faces;


Setting set = new Setting(); // 옵션창 객체 생성
Effect ef = new Effect();
memo memo = new memo();
Diary diary = new Diary();
face f = new face();

void setup() {
  print(displayWidth/2, displayHeight/2);
  
  minim = new Minim(this);
  int disW = 960;
  int disH = 540;
  background(0);
  img = loadImage("fire.jpg");
  song1 = minim.loadFile("fire_music.mp3");
  song2 = minim.loadFile("yume.mp3");
  song3 = minim.loadFile("memoFire.mp3");
  song4 = minim.loadFile("backgroundBGM.mp3");
  song5 = minim.loadFile("반딧불이의저녁.mp3");
  surface.setResizable(false);
  surface.setSize(disW, disH);
  ef.ImgSet();
  memo.set();
  diary.s();

  song1.loop(); // 작업하는데 소리가 계속 들려서 잠시 꺼둠
  song2.loop();
  song4.loop();
  song5.loop();
  song4.mute();
  song5.mute();
  
  video = new Capture(this, 960, 540);
}

void draw() { 

  background(0);
  song1.setGain(set.getHs1Volume()* 0.86 - 80);
  song2.setGain(set.getHs2Volume()* 0.86 - 80);
  song4.setGain(set.getHs2Volume()* 0.86 - 80);
  song5.setGain(set.getHs2Volume()* 0.86 - 80);
  image(img, 0, 0, 640, 540);
  set.btn();
  diary.set();

  if (mousePressed) {
    mx = mouseX;
    my = mouseY;
    i = 0;
  }
  if (!set.CheckOption() && mx <= 640 && !diary.getCheckDiary()) {
    ef.drawImage(mx, my, i);
  }
  i ++;
  memo.Clicked();  
  
  opencv = new OpenCV(this, video);
  f.videoSetting();
  f.videoCheck();
  
}

void keyPressed() {
  memo.plusWord(key + "");
  if(diary.getCheckDiary()){
      diary.writeDiary();
  }
}

void mouseMoved() {    
  if (!mousePressed) {
    a = memo.getMemoPoint(); 
  }

}

void mouseDragged(){
  CheckMemoDragged = true;
  memo.memoDragged(mouseX, mouseY, a); 
  for (int i = 0; i < memo.getArrayList().size(); i ++) {
    memo.drawMemo(memo.getArrayList().get(i));
  }
}

void mouseReleased(){
  if(mouseX <= 400 && mouseY >= 0 && mouseY <= 540 && CheckMemoDragged) {
    memo.removeMemo(a);
    CheckMemoDragged = false;
  } 
  else {
    if (a <= 4) {
      memo.memoDragged(680, 120 + 80 * a, a);
      //print(clikckedMemo + ", " + a + "   ");
    }
  }
}


void stop() {
  song1.close();
  song2.close();
  minim.stop();
  super.stop();
}
