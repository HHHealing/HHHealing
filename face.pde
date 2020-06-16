//import gab.opencv.*;
//import processing.video.*;
//import java.awt.Rectangle;

//Capture video;
//OpenCV opencv;
//Rectangle[] faces;

/*
PImage img;

void setup(){
  size(640, 480);
  video = new Capture(this, 640, 480);
  video.start();
  img = loadImage("hyo.png");
  imageMode(CORNER);
}

void draw(){
  if(video.available() == true){
    video.read();
    image(video, 0, 0);
    opencv = new OpenCV(this, video);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
    faces = opencv.detect();

    for(int i=0; i<faces.length; i++){
      image(img, faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  }
}
*/

//void setup(){
//  size(848, 480);
  
//  String[] videoeras = Capture.list();
///* 
//  for(int i=0; i<videoeras.length; i++){
//    println("[" + i + "] " + videoeras[i]);
//  }
//*/
//  video = new Capture(this, videoeras[3]);
//  video.start();
//}

//void draw(){
//  if(video.available() == true){
//    video.read();
////    scale(-1,1);
////    image(video, -width, 0);
//    image(video, 0, 0);
    
//    opencv = new OpenCV(this, video);
//    opencv.loadCascade(OpenCV.CASCADE_MOUTH);
////    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
//    faces = opencv.detect();
    
//    for(int i=0; i<faces.length; i++){
//      stroke(#ff0000);
//      noFill();
//      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
//    }
//  }
//}
