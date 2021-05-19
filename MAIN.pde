/*
 Alunos:

 André Luiz Kovalski 
 Leonardo Augusto de Jesus Luize 
 Mikael Da Silva Sirqueira 
 Pedro Henrique Mess Dubberstein Oviedo Ferreira 
 Rodrigo Alves Bolincenha 
 
 */



import com.dhchoi.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.sound.*;


Minim          minim;
//AudioInput     myAudio;
AudioPlayer    myAudio;
ddf.minim.analysis.FFT            myAudioFFT;

static final int NUM_LINES = 15;

boolean soundPlay = false; //serve pra ser se a musica do SOUND ta tocando
int corner = 5;

void setup() {
  size(700, 700); //comentar esse e descomentar o de baixo para ver o shapes 3 corretamente
  //size(700, 700, P3D); //comentar esse e descomentar o de cima para ver o video corretamente
  background(#7F00FF);
  //capture = new Capture(this, 700, 600); //ativar para funcionar a parte de video

  particles = new Particle [5000];              // pega isso
  for (int a = 0; a < particles.length; a++) {  // pega isso
    particles[a] = new Particle();              // pega isso
  }

  minim = new Minim(this);
  //myAudio = minim.getLineIn(Minim.MONO);
  myAudio = minim.loadFile(shapes[0]);


  myAudioFFT = new ddf.minim.analysis.FFT(myAudio.bufferSize(), myAudio.sampleRate());
  myAudioFFT.linAverages(myAudioRange);
  myAudioFFT.window(ddf.minim.analysis.FFT.GAUSS);
}

void draw() {
  if ( currentScreen == 0  ) screen1();
  if ( currentScreen == 1  ) screen2();
}

void screen1() {
  background(#2F3136);

  fill(#FCFCFC);
  rect(250, 475, 200, 50, corner, corner, corner, corner);

  fill(#202020);
  textSize(32);
  text("Próximo", 290, 510);

  fill(255);
  textSize(45);
  text("Audio Visualizer", 175, 250);

  textSize(25);
  text("Veja a interação do áudio", 190, 300); 
  text("Em diversos exemplos", 210, 330);

  fill(0, 15);
  rect(0, 0, width, height);

  fill(255);
  ellipse(random(width), random(height), 6, 6);
}

void screen2() {
  myAudioFFT.forward(myAudio.mix);
  myAudioDataUpdate();

  fill(255, 255);
  noStroke();
  round(5);

  if ( currentSection == 0  ) {
    shapes();
  } // screen 2 padrão

  if ( currentSection == 1  ) {
    shapes1(); 
  } // exemplo Leo

  if ( currentSection == 2  ) {
    shapes2(); 
  }// exemplo Pedro

  if ( currentSection == 3  ) {
    shapes3(); 
  }// exemplo Kovalski

  if ( currentSection == 4  ) {
    video(); 
  }// exemplo Mikael

  if ( currentSection == 5  ) {
    image1(); 
  } // exemplo Rodrigo
  menuInferior();
}

void stop() {
  myAudio.close();
  minim.stop();
  super.stop();
}

float x0(float t) {
  return sin(t/12)*130 + cos(t/11) * 100;
}

float y0(float t) {
  return cos(t/10)*100  + sin(t/16) * 100;
}

float x1(float t) {
  return sin(t/10)*100;
}

float y1(float t) {
  return cos(t/10)*100;
}

float x2(float t) {
  return sin(t/10)*100;
}

float y2(float t) {
  return cos(t/10)*100 ;
}

float x3(float t) {
  return cos(t/10)*100 + sin(t/21) * 201 ;
}

float y3(float t) {
  return cos(t/10)*100 + sin(t/14) * 137;
}

void menuInferior() {
  noStroke();
  fill(#2F3136);
  rect(0, 550, width, 200);

  textSize(14);
  fill(#4F5257); 
  rect(10, 575, 100, 40, corner, corner, corner, corner); 
  fill(255); 
  text("Shapes-1", 20, 600);
  fill(#4F5257); 
  rect(150, 575, 100, 40, corner, corner, corner, corner);
  fill(255); 
  text("Shapes-2", 160, 600);
  fill(#4F5257); 
  rect(290, 575, 100, 40, corner, corner, corner, corner); 
  fill(255); 
  text("Shapes-3", 300, 600);
  fill(#4F5257); 
  rect(430, 575, 100, 40, corner, corner, corner, corner); 
  fill(255); 
  text("Vídeo", 440, 600);
  fill(#4F5257); 
  rect(570, 575, 100, 40, corner, corner, corner, corner);
  fill(255); 
  text("Imagem", 580, 600);

  fill(#4F5257); 
  rect(150, 650, 100, 40, corner, corner, corner, corner);
  fill(255); 
  text("Play", 160, 675);

  fill(#4F5257); 
  rect(430, 650, 100, 40, corner, corner, corner, corner);
  fill(255); 
  text("Pause", 440, 675);
  
  fill(#4F5257);
  //trocaMusica(10, 650, 100, 40, corner); excluindo a função trocaMusica, muito trampo arrumar tudo em um dia
}
