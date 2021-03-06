//*********************************************
// Example Code for Interactive Intelligent Products
// Rong-Hao Liang: r.liang@tue.nl
//*********************************************

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

int div = 2;
PImage src;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/div, 480/div);
  opencv = new OpenCV(this, 640/div, 480/div);
  opencv.useColor();
  video.start();
  imageMode(CENTER);
}

void draw() {
  opencv.loadImage(video);
  src = opencv.getSnapshot();
  //mirror the view
  pushMatrix();
  scale(-div, div);
  translate(-width/(div*2), height/(div*2));
  image(src, 0, 0);
  popMatrix();

}

void captureEvent(Capture c) {
  c.read();
}
