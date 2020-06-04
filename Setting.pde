class Setting{
  int size = 40; // 설정 버튼 크기를 40으로 설정
  int x = 700; // 설정창 x축 크기
  int y = 400; // 설정창 y축 크기
  PImage img;
  
  void btn(){
    img = loadImage("option.png"); // 옵션창 이미지 설정
    image(img, 0, 0, size, size); // 이미지 삽입

  }
  
  
  void mouseClicked(){
     print("Clicked"); 
  }
  
  void draw(){
    
  }
  
  
void drawOption(){  
  rect(displayWidth/4 - x/2, displayHeight/4 - y/2, x, y);  
}}
