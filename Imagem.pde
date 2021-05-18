PImage Frog;

int cellsize = 2; // Dimensions of each cell in the grid
int i=0;  

void image1() {
  Frog = loadImage("img.jpg");
  background(0);
  
  // Begin loop for columns
  int xx ; // x position
  int yy ; // y position
  color c = color(random(255)); // the color

  // use map()
  float val1 = map (abs(myAudio.left.get(i)), 0, 5, 20, width);      
  float val2 = map (abs(myAudio.right.get(i)), 0, 6, 0, height);

  // Calculate a position 
  xx = int(val1); // 
  yy = int(val2); // 

  // Translate to the location, set fill and stroke, and draw the rect
  pushMatrix();
  translate(xx+5, yy);
  fill(c, 100);
  noStroke();
  //rectMode(CENTER);
  image(Frog, 50, 50);

  popMatrix();
  i++;
}
