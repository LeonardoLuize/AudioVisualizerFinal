float t;

void shapes() {
  pushMatrix();
  background(#7F00FF);

  //Visualização do áudio
  if (showVisualizer) myAudioDataWidget();

  translate(width/2, height/2);

  //Cobrinha colorida
  for (int i = 0; i < 25; i++) {
    int fftFillColor = (int)map(myAudioData[i] + 50, 0, myAudioMax, 0, 255);
    fill(255, fftFillColor, 232);
    ellipse(x0(t+i), y0(t+i) - 150, 10, 10);
  }

  t += 0.5;
  popMatrix();
}
