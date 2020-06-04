class Setting{
  int size = 40; // 설정 버튼 크기를 40으로 설정
  int x = 700; // 설정창 x축 크기
  int y = 400; // 설정창 y축 크기
  PImage img; // 설정 이미지를 넣을 변수
  boolean CheckOption = false; // 설정창이 켜져있는지 확인하는 변수
         
  void btn(){
    img = loadImage("option.png"); // 설정창 이미지 설정
    image(img, 0, 0, size, size); // 이미지 삽입
    if(mousePressed && CheckOption == false && 
       mouseX < size && mouseY < size){ // 설정창을 눌렀으며 설정창이 열리지 않은 상태일 때
       mouseClicked(); 
       CheckOption = true;
    }
  }
  
  void mouseClicked(){
     drawOption();
  }
          
    
  void draw(){
    
  }
  
  
  void drawOption(){  
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);  
  }
}
