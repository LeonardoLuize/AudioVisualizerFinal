float n4;
float n6;


void shapes2() {
  pushMatrix();
  background(#000000);
  fill(0, 50);  
  noStroke();
  rect(0, 0, width, height);

  translate(width/2, height*0.37);

  for (int i = 0; i < myAudio.bufferSize() - 1; i++) {

    float angle = sin(i+n4)* 1; 
    float angle2 = sin(i+n6)* 300; 

    float x = sin(radians(i))*(angle2+300); 
    float y = cos(radians(i))*(angle2+150);

    float x3 = sin(radians(i))*(150/angle); 
    float y3 = cos(radians(i))*(150/angle);

    fill (#ffffff, 90); 
    ellipse(x, y, myAudio.left.get(i)*10, myAudio.left.get(i)*10);

    fill ( #ff0000, 60); 
    rect(x3, y3, myAudio.left.get(i)*20, myAudio.left.get(i)*10);

    fill ( #ffffff, 90); 
    rect(x, y, myAudio.right.get(i)*20, myAudio.left.get(i)*10);


    fill( #ff0000, 70); 
    rect(x3, y3, myAudio.right.get(i)*20, myAudio.right.get(i)*20);
  }

  n4 += 0.008;
  n6 += 0.04;
  popMatrix();
}
