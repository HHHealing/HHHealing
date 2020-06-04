class Setting{
  int size = 40; // 설정 버튼 크기를 40으로 설정
  int x = 700; // 설정창 x축 크기
  int y = 400; // 설정창 y축 크기
  PImage img; // 옵션 이미지를 넣을 변수
  boolean CheckOption = false; // 옵션창이 켜져있는지 확인하는 변수
  
     
  
  
  void btn(){
    img = loadImage("option.png"); // 옵션창 이미지 설정
    image(img, 0, 0, size, size); // 이미지 삽입
    if(mousePressed && CheckOption == false && mouseX < size && mouseY < size){
       mouseClicked(); 
       CheckOption = true;
    }
  }
  
  void mouseClicked(){
     double mx = mouseX;
     double my = mouseY;   
     print(mx, my);
     if(CheckOption == false && mx < size && my < size){ // 옵션창이 켜져있고 옵션 부분을 클릭하였을 때
       CheckOption = true;
       drawOption();
     }
  }
  
      
  
  
  
  void draw(){
    
  }
  
  
  void drawOption(){  
    rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);  
  }
}
