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
  //hai
  fill(70,70,70);
  rect(0,0,480,480);
  //tya
  fill(230,150,70);
  rect(0,220,480,480);
  //ao
  fill(0,70,250);
  rect(0,400,480,480);
  triangle(0,400,480,480,480,360);
  //yama
  fill(230,150,70);
  triangle(0,220,100,110,200,220);
  triangle(200,220,260,165,320,220);
  //tuki
  fill(250,250,0);
  ellipse(380,85,60,60);
  fill(70,70,70);
  ellipse(365,90,48,48);
  //hosi
  stroke(250,250,0);
  line(210,85,210,100);
  line(203,92,217,92);
  line(280,50,280,60);
  line(275,55,285,55);
  line(350,140,350,144);
  line(348,142,352,142);
  noStroke();
  //ki
  fill(0,0,0);
  triangle(400,350,415,170,430,350);
  triangle(415,200,430,202,415,205);
  triangle(415,240,300,244,415,248);
  triangle(415,290,475,293,415,296);
  //hukurou
  triangle(340,225,360,275,380,225);
  rect(340,200,40,25);
  triangle(340,200,350,190,360,200);
  triangle(360,200,370,190,380,200);
  fill(255,255,255);
  ellipse(350,213,13,13);
  ellipse(368,213,13,13);
  fill(0,0,0);
  ellipse(347,213,5,5);
  ellipse(365,213,5,5);
  
}
