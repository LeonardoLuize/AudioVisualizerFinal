int particlesColor, particlesWidth, circleColor, widthCircle, heightCircle;

void shapes1() {
  pushMatrix();
  background(#0ED2F7);
  fill(255, 255);
  strokeWeight(5);

  translate(width/2, height-470);

  for (int i = 0; i < NUM_LINES; i++) {
    int fftFillColor = (int)map(myAudioData[i] + 50, 0, myAudioMax, 0, 255);

    //Circulo
    noStroke();
    fill(fftFillColor, 253, 253);
    ellipse(0, 0, widthCircle, heightCircle);


    //Linhas Particulas
    fill(14, particlesColor, 247);
    ellipse(y3(t+i), x3(t+i), 10, 10);


    ellipse(y3(t+i) * -1, x3(t+i) * -1, 10, 10);


    //Linha circulo
    stroke(fftFillColor, 253, 253);
    line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));


    line(y1(t+i), x1(t+i), y2(t+i), x2(t+i));



    if (fftFillColor >= 380) {
      particlesColor = fftFillColor;
      particlesWidth = 10;
    } else if (fftFillColor >= 350) {


      widthCircle = 160;
      heightCircle = 160;
      particlesWidth = 9;
    } else if (fftFillColor >= 160) {
      widthCircle = 145;
      heightCircle = 145;
      particlesWidth = 8;
    } else if (fftFillColor >= 140) {
      widthCircle = 130;
      heightCircle = 130;
      particlesWidth = 7;
    } else if (fftFillColor >= 120) {
      widthCircle = 115;
      heightCircle = 115;
      particlesWidth = 6;
    } else if (fftFillColor >= 100) {
      widthCircle = 100;
      heightCircle = 100;
      particlesWidth = 4;
    } else if (fftFillColor >= 80) {
      widthCircle = 80;
      heightCircle = 80;
      particlesWidth = 2;
    } else {

      particlesColor = 210;
      particlesWidth = 0;
      widthCircle = 60;
      heightCircle = 60;
    }

    if (fftFillColor >= 0 && fftFillColor <= 50 ) {
      widthCircle = 50;
      heightCircle = 50;
    } else if (fftFillColor > 50 && fftFillColor <= 100) {
      widthCircle = 100;
      heightCircle = 100;
    } else if (fftFillColor > 50 && fftFillColor <= 100) {
      widthCircle = 100;
      heightCircle = 100;
    }
  }

  for (int i = 0; i < NUM_LINES; i++) {
    int fftFillColor = (int)map(myAudioData[i] + 50, 0, myAudioMax, 0, 255);
    //Circulo
    noStroke();

    //Linhas Particulas
    fill(14, particlesColor, 247);
    ellipse(x3(t+i), x1(t+i), 10, 10);


    ellipse(x3(t+i) * -1, x1(t+i) * -1, 10, 10);

    if (fftFillColor >= 350) {
      particlesColor = fftFillColor;
    } else {
      particlesColor = 210;
    }
  }


  t += 0.5;
  popMatrix();
}
