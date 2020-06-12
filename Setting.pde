import controlP5.*;


class Setting{
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
  HScrollbar hs1;
  
  void btn(){
    hs1 = new HScrollbar(378, 84, 100, 16, 16);
    SpeakerOn = loadImage("speaker_on.png");
    SpeakerOff = loadImage("speaker_off.png");
    
    img = loadImage("option.png"); // 설정창 이미지 설정
    image(img, 0, 0, size, size); // 이미지 삽입
    if(CheckOption){ // 설정창이 켜져 있을 경우
    
      if(mousePressed && !(mouseX >= displayWidth/4 - x/2 && mouseX <= displayWidth/4 - x/2 + x && mouseY >= displayHeight/4 - y/2 && mouseY <= displayHeight/4 - y/2 + y)){ // 설정창 외의 곳을 클릭한 경우 설정창 닫기
        CheckOption = false;
      }
      else{ // 설정창 내부를 클릭한 경우는 그대로 출력
        drawOption(); 
      }
    }
    else if(mousePressed && !CheckOption){ // 설정창이 켜져 있지 않을 경우
      CheckOption = mouseClicked(); 
    }
    
  }
          
  boolean mouseClicked(){
    if(mouseX <= size && mouseY <= size){ // 설정 버튼을 클릭했을 때 설정창 켜기
       drawOption();     
       return true;
    }
    else{ // 설정 버튼 외의 곳을 클릭했을 경우 아무일도 일어나지 않음
       return CheckOption; 
    }
  }

  void drawOption(){  
    fill(204, 102, 0);
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);  // 330, 70, 300, 400        
    image(SpeakerOn, displayWidth/4 - x/2, displayHeight/4 - y/2, size, size);
    if(!CheckSlider){
      drawSliderBar();
      CheckSlider = true;
    }
    hs1.update();
    hs1.display(); 
  }

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
}
