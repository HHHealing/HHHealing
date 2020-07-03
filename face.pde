class face {


  PImage img, videoImg;
  boolean CheckVideo = false;
  void videoSetting() {

    img = loadImage("hyo.png");

    videoImg = loadImage("video.png");
    videoImg.resize(0, 100);
    image(videoImg, 640 + 110, 0);
    imageMode(CORNER);
  }

  void drawImageToFace() {
      if (video.available() == true) {
        video.read();
        image(video, 0, 0);
        opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
        faces = opencv.detect();

        for (int i=0; i<faces.length; i++) {
          image(img, faces[i].x, faces[i].y, faces[i].width, faces[i].height);
        }
      
    }
  }
  void videoCheck(){
     if(mousePressed && mouseX >= 480 + 110 && mouseX <= 480 + 210 && mouseY <= 100){
        CheckVideo = true;
        video.start();
     }
     else{
       if(mousePressed){
         CheckVideo = false;
         video.stop();
       }
       else if(CheckVideo){
         drawImageToFace();
       }

     }
  }
  
  boolean getCheckVidro(){
   return CheckVideo; 
  }
}
