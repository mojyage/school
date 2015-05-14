PFont myFont;
void setup() {
  size(480, 480);
  background(255, 255, 255);
  fill(0, 0, 0);
  smooth();
  noStroke();
  frameRate(50);
  myFont = createFont("MS Gothic", 24, true);
  textFont(myFont);
}
void draw() {
  //yane
  fill(0, 0, 200);
  triangle(50, 100, 150, 50, 250, 100);
  //kabe
  fill(200, 0, 0);
  rect(75, 100, 150, 120);
  //mado
  fill(0, 50, 70);
  rect(95, 120, 30, 30);
  //doa
  fill(150, 100, 0);
  rect(165, 160, 30, 60);
}

