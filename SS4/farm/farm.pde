PImage cow;
PImage hay;
PImage dirt;
PImage sky;
int L_buttonX=50;
int L_buttonY=height/2+150;
int hayX=width/2;
int hayY=height/2;
float drop=400;

void setup() {
  size(1200, 500);
  background(255);
  imageMode(CENTER);
  rectMode(CENTER);
  cow=loadImage("beast.png");
  hay=loadImage("Hay.png");
  dirt=loadImage("dirt.png");
  sky=loadImage("sky.png");
}

void draw() {
  background(145, 202, 235);
  noStroke();
  /*for (int c=0; c<=width; c+=20) {
   fill(173, 166, 144);
   rect(c, height/2+160, 50, 200);
   fill(105, 99, 84);
   rect(c+10, height/2+160, 50, 200);
   //left_button
   fill(0);
   rect(L_buttonX, L_buttonY+200, 50, 50, 50);
   fill(252, 252, 169);
   if (drop==height/2) {
   drop=height/2;
   // }*/
  image(sky, width/2, height/2-100);
  sky.resize(1200, 300);
  image(dirt, width/2, height/2+200);
  dirt.resize(1200, 300);
  image(cow, width/2, height/2);
  image(hay, mouseX, mouseY);
  if (
  //mousePressed&&  
  mouseX>=width/2&&mouseY>=height/2&&mouseX>=width/2+50&&mouseY>=height/2+50
    ) {
    image(hay, width/2, height/2-drop++);
    if (drop<height) {
      drop++;
    }
  }
}
