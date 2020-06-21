import controlP5.*;
/* 설정창에 추가할 내용(시간이 있다면)
 *  음악 선택
 *  종이 색 변경
 *  종이에 쓰는 글씨 크기 변경
 *  
 */
class Setting {
  int size = 40; // 설정 버튼 크기를 40으로 설정
  int x = 300; // 설정창 x축 크기
  int y = 400; // 설정창 y축 크기
  PImage img; // 설정 이미지를 넣을 변수
  boolean CheckOption = false; //  설정창이 켜져있는지 확인하는 변수
  PImage SpeakerOn;
  PImage SpeakerOff;
  ControlP5 slider;  
  Slider sl;
  boolean CheckSlider = false;
  HScrollbar hs1, hs2, sR, sG, sB;
  int mVolume = 50; // 모닥불 볼륨
  int bVolume = 50; // 배경음악 볼륨
  int R = 100; 
  int G = 100; 
  int B = 100;
  PFont myFont;
  int RGB [];

  void btn() {
    hs1 = new HScrollbar(378, 90, 100, 16, 16, mVolume);
    hs2 = new HScrollbar(378, 106 + size/2, 100, 16, 16, bVolume);
    sR = new HScrollbar(378, 170, 100, 16, 16, R);
    sG = new HScrollbar(378, 210, 100, 16, 16, G);
    sB = new HScrollbar(378, 250, 100, 16, 16, B);
    SpeakerOn = loadImage("speaker_on.png");
    SpeakerOff = loadImage("speaker_off.png");

    img = loadImage("option.png"); // 설정창 이미지 설정
    image(img, 0, 0, size, size); // 이미지 삽입
    if (CheckOption) { // 설정창이 켜져 있을 경우

      if (mousePressed && !(mouseX >= displayWidth/4 - x/2 && mouseX <= displayWidth/4 - x/2 + x && mouseY >= displayHeight/4 - y/2 && mouseY <= displayHeight/4 - y/2 + y)) { // 설정창 외의 곳을 클릭한 경우 설정창 닫기
        CheckOption = false;
      } 
      else { // 설정창 내부를 클릭한 경우는 그대로 출력
        drawOption();
      }
    } 
    else if (mousePressed && !CheckOption) { // 설정창이 켜져 있지 않을 경우
      CheckOption = mouseClicked();
    }
  }

  boolean mouseClicked() {
    if (mouseX <= size && mouseY <= size) { // 설정 버튼을 클릭했을 때 설정창 켜기
      drawOption();     
      return true;
    } else { // 설정 버튼 외의 곳을 클릭했을 경우 아무일도 일어나지 않음
      return CheckOption;
    }
  }

  void drawOption() {  
    fill(204, 102, 0);
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);  // 330, 70, 300, 400        
    image(SpeakerOn, displayWidth/4 - x/2, displayHeight/4 - y/2, size, size);
    image(SpeakerOn, displayWidth/4 - x/2, displayHeight/4 - y/2 + size, size, size);
    if (!CheckSlider) {
      //drawSliderBar();
      CheckSlider = true;
    }
    hs1.update();
    hs1.display();
    hs2.update();
    hs2.display();
    sR.update();
    sR.display();
    sG.update();
    sG.display();
    sB.update();
    sB.display();
    mVolume = round(hs1.getPos1()); // 현재의 볼륨을 저장
    bVolume = round(hs2.getPos1());
    R = round(sR.getR());
    G = round(sG.getG());
    B = round(sB.getB());

    myFont = createFont("한초롬바탕", 20);
    textFont(myFont);
    fill(255);
    textAlign(CENTER, CENTER);
    text("효과음", 540, 85);
    text("배경음악", 540, 120);
    fill(255, 0, 0);
    text("R", 520, 165);
    fill(0, 255, 0);
    text("G", 520, 205);
    fill(0, 0, 255);
    text("B", 520, 245);

    fill(round(R * 2.25), round(G * 2.25), round(B * 2.25));
    rect(550, 185, 40, 40);

    selectMusic();
    soundChange();
  }
  /*
  void drawSliderBar(){  
   slider = HHHealing.slider;
   sl = slider.addSlider("mc").setPosition(100, 100).setRange(0, 100);
   CallbackListener adjustLabel = new CallbackListener() {
   public void controlEvent(CallbackEvent c) {
   if(c.getAction()==ControlP5.ACTION_BROADCAST) {
   sl.getValueLabel().setText(String.format("%.0f" , sl.getValue()));
   }
   }
   }; 
   sl.addCallback(adjustLabel);
   }
   */

  int getHs1Volume() {
    return mVolume;
  }

  int getHs2Volume() {
    return bVolume;
  }

  boolean CheckOption() {
    return CheckOption;
  }

  int[] RGB() {
    RGB = new int[3];
    RGB[0] = round(R*2.25);
    RGB[1] = round(G*2.25);
    RGB[2] = round(B*2.25);
    return RGB;
  }

  void selectMusic() {
    fill(255);
    textAlign(CENTER);    
    rect(displayWidth/4 - x/2 + 75, 280, 150, 40);    
    rect(displayWidth/4 - x/2 + 75, 330, 150, 40);
    rect(displayWidth/4 - x/2 + 75, 380, 150, 40);
    fill(0);
    text("배경음악1", displayWidth/4 - x/2 + 150, 300);
    text("배경음악2", displayWidth/4 - x/2 + 150, 350);
    text("배경음악3", displayWidth/4 - x/2 + 150, 400);
  }

  void soundChange() {
    if (CheckOption && mousePressed && mouseX >= displayWidth/4 - x/2 + 75 && mouseX <= displayWidth/4 - x/2 + 225 && mouseY >= 280 && mouseY <= 320) {
      song2.unmute();
      song5.mute();
      song4.mute();
      
    } 
    else if (CheckOption && mousePressed && mouseX >= displayWidth/4 - x/2 + 75 && mouseX <= displayWidth/4 - x/2 + 225 && mouseY >= 330 && mouseY <= 370) {
      song2.mute();
      song4.unmute();
      song5.mute();
    }
    else if(CheckOption && mousePressed && mouseX >= displayWidth/4 - x/2 + 75 && mouseX <= displayWidth/4 - x/2 + 225 && mouseY >= 380 && mouseY <= 420){
      song2.mute();
      song4.mute();
      song5.unmute();
    }
  }
}
