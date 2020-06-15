class memo{
   PImage img;
   int size = 100;
   
   void set(){
      img = loadImage("memo.png");
      img.resize(0, size);
      image(img, displayWidth/2 - size, 0);
   }
}
