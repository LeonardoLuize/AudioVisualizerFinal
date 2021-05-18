String texto_selecao = "Utilizar música de escolha";
boolean selecao = false, triggerMusica = false;

//a função trocaMusica funciona, mas da muito problema pra considerar colocar no projeto

//esse vetor string aqui vai receber os nomes das musicas stock do programa
String[] shapes = {"myAudio.mp3", "myAudio2.mp3", "musicateste.mp3"};

void trocaMusica(int posX, int posY, int comprimento, int altura, int corner) {
  rect(posX, posY, comprimento, altura, corner, corner, corner, corner); //eu aproveitei e ja coloquei pra desenhar o botão dentro da função
  fill(255); 
  text(texto_selecao, posX + comprimento*0.03, (posY +altura*0.5)+5);  //texto dentro do botão 
  if (mousePressed && triggerMusica == false) {
    if (mouseX > posX && //ponto de inicio X do botão
      mouseX < posX + comprimento && //ponto de inicio X + comprimento
      mouseY > posY && //ponto de inicio Y do botão
      mouseY < posY + altura) //ponto de inicio Y + altura
    {
      triggerMusica = true;
      if (currentSection==3) {
        if (fileSound!=null) {
          fileSound.stop();
        }
      } else {
        myAudio.close();
      }
      if (selecao == false) {//indo de musicaStock -> musicaEscolhida
        selecao = true;
        selectInput("Select a file to process:", "fileSelected");
        
      } else {//indo de musicaEscolhida -> musicaStock
        selecao = false;
        if (currentSection==3) { //selection.getAbsolutePath()
          fileSound.stop();
          fileSound = new processing.sound.SoundFile(this, "asgore.wav");
          fileSound.play();
        } else {
          if (currentSection<3) {
            myAudio.close();
            myAudio = minim.loadFile(shapes[currentSection]);
            myAudio.play();
          }
        }
      }
    }
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    selecao = false; //volta pro estado musicaStock
  } else {
    fileSound.stop();
    fileSound = new processing.sound.SoundFile(this, selection.getAbsolutePath());
    myAudio.close();
    myAudio = minim.loadFile(selection.getAbsolutePath());
  }
  if (currentSection==3) {
    fileSound.play();
  } else {
    myAudio.play();
  }
}

void mouseReleased() {
  triggerMusica = false;
}
