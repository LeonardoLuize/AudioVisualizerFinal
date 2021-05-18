byte currentScreen = 0; //tela de inicio, tela do visualizer
int currentSection = 0; //qual visualizer estamos?

//a variavel shapes[] ta na aba TrocaMusica

void mousePressed() {
  if (currentScreen==0) {
    if (mouseX > 250 && mouseX < 250 + 200 && mouseY > 475 && mouseY < 475 + 50) { //botão [PRÓXIMO] tela 1
      currentScreen = 1;
      myAudio.loop();
    }
  }
  if (currentScreen==1) {
    if (mouseX > 10 && mouseX < 10 + 100 && mouseY > 575 && mouseY < 575 + 40) { //botão [SHAPES-1] tela 2
      currentSection = 1;
      if (!selecao) {//se não tem seleção de musica do usuário
        myAudio.close();
        myAudio = minim.loadFile(shapes[1]);
        myAudio.loop();
      }else{
        myAudio.play();
      }
    }
    if (mouseX > 150 && mouseX < 150 + 100 && mouseY > 575 && mouseY < 575 + 40) { //botão [SHAPES-2] tela 2
      currentSection = 2;
      if (!selecao) {//se não tem seleção de musica do usuário
        myAudio.close();
        myAudio = minim.loadFile(shapes[2]);
        myAudio.loop();
      }else{
        myAudio.play();
      }
    }
    if (mouseX > 290 && mouseX < 290 + 100 && mouseY > 575 && mouseY < 575 + 40) { //botão [SHAPES-3] tela 2
      currentSection = 3;
      if (!selecao) {  //se não tem seleção de musica do usuário
        myAudio.close(); //isso é tipo um setup, e ja que eu sou o cara que ta usando sound, fica cheio de coisa aqui
        BATIDA = new processing.sound.BeatDetector(this);
        fileSound = new processing.sound.SoundFile(this, "asgore.wav");
        fftSound = new processing.sound.FFT(this, bands);

        fftSound.input(fileSound);
        BATIDA.input(fileSound);
        BATIDA.sensitivity(130);
        fileSound.play(1, 1);
        strokeWeight(1);
        soundPlay = true; //essa variavel vai servir para não dar play em multiplos sounds ao mesmo tempo
      }else{
        myAudio.close();
        fileSound.play(1, 1);
      }
    }
    if (mouseX > 430 && mouseX < 430 + 100 && mouseY > 575 && mouseY < 575 + 40) { //botão [VÍDEO] tela 2
      currentSection = 4;
    }
    if (mouseX > 570 && mouseX < 570 + 100 && mouseY > 575 && mouseY < 575 + 40) { //botão [IMAGEM] tela 2
      currentSection = 5;
      if (!selecao) {//se não tem seleção de musica do usuário
        myAudio.close();
        myAudio = minim.loadFile("imagemAudio.mp3");
        myAudio.loop();
      }else{
        myAudio.play();
      }
    }
    if (mouseX > 150 && mouseX < 150 + 100 && mouseY > 650 && mouseY < 650 + 40) { //botão [PLAY] tela 2
      if (currentSection == 4 && soundPlay == false) {
        fileSound.play();
        soundPlay = true;
      } else {
        myAudio.play();
      }
    }
    if (mouseX > 430 && mouseX < 430 + 100 && mouseY > 650 && mouseY < 650 + 40) { //botão [PAUSE] tela 2
      if (currentSection == 4) {
        fileSound.pause();
        soundPlay = false;
      } else {
        myAudio.pause();
      }
    }
  }
  if (currentSection != 3) {
    if (fileSound==null) {
    } else {
      fileSound.stop();
    }
  }
}
