import processing.video.*;

Particle[] particles;
Capture capture;

boolean showVisualizer = true;

int myAudioRange = 101;
int myAudioMax = 100;
int rect = 86;
int x = 7;
int y = 20;
int y_ = rect;
int[] nums = new int [8];

float myAudioAmp = 40.0;
float myAudioIndex = 0.2;
float myAudioIndexAmp = myAudioIndex;
float myAudioIndexStep = 0.35;
float[] myAudioData = new float[myAudioRange];

void video() {
  capture.start();
  for (int a = 0; a < particles.length; a++) {
    particles[a].display();                    
    particles[a].move();
  }

  if (mousePressed) { // pega isso
    if (mouseButton==LEFT)  filter(THRESHOLD); 
    else filter(INVERT);
  }

  if (keyPressed) {
    if (key=='s' || key=='S') 
    { 
      saveFrame("frame.png");
    }
  }
  if (showVisualizer) myAudioDataWidget();
}

void myAudioDataUpdate() {
  for (int i = 0; i < myAudioRange; i++) {
    float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
    float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
    myAudioData[i] = tempIndexCon;
    myAudioIndexAmp += myAudioIndexStep;
  }
  myAudioIndexAmp = myAudioIndex;
}

void myAudioDataWidget() {
  noStroke();
  for (int i = 0; i < myAudioRange; i++) {
    if (i==0) fill(#E775D2);
    else if (i==3) fill(#E775D2);
    else fill(#FF84E8);

    rect(5 + (i*10), (548-myAudioData[i]), 3, myAudioData[i] + 2);
  }
}


void captureEvent(Capture video) {
  video.read();
}

class Particle {
  float f;
  float g;

  float vx;
  float vy;

  Particle() {
    f = width/2;
    g = height/2;
    float b = random(TWO_PI);
    float speed = random(5, 3);
    vx = cos(b*2)*speed;
    vy = sin(b*2)*speed;
  }

  void display() {
    noStroke();
    color collor = capture.get(int(f), int(g));
    fill(collor, 25);
    ellipse(f, g, 12, 12);
  }

  void move() {
    f = f + vx;
    g = g + vy;
    if (g < 0) {
      g = height;
    } 

    if (g > height) {
      g = 0;
    }
    if (f < 0) {
      f = width;
    } 

    if (f > width) {
      f = 0;
    }
  }
}
