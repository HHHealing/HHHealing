class memo{
   PImage img;
   int size = 100;
   
   void set(){
      img = loadImage("memo.png");
      img.resize(0, size);
      image(img, displayWidth/2 - size, 0);
   }
   
   void Clicked(){
       if(mouseClicked()){
         
       }
   }
   
   boolean mouseClicked(){
      if(mousePressed && mouseX >= displayWidth/2 - size && mouseX <= displayWidth/2 && mouseY <= size){
         return true;
      }
      else{
         return false; 
      }
   }
   
   void drawMemo(){
       
   }
}
