PImage cow;
PImage hay;
PImage dirt;
PImage sky;
PImage water;
int L_buttonX=50;
int L_buttonY=height/2+150;
int hayX=width/2;
int hayY=height/2;
float drop=400;
int hay_size=200;
float hayYLoc=height/2;

void setup() {
  size(1200, 500);
  background(255);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(30);
  cow=loadImage("beast.png");
  hay=loadImage("Hay.png");
  dirt=loadImage("dirt.png");
  sky=loadImage("sky.png");
  water=loadImage("bucket.png");
  hayX=width/2;
  hayY=height/2;
}

void draw() {
  background(145, 202, 235);
  noStroke();
  image(sky, width/2, height/2-100);
  sky.resize(1200, 600);
  image(dirt, width/2, height/2+250);
  dirt.resize(1200, 300);
  // move the cow
  image(cow, mouseX, hayY);
  image(water, hayX-500, hayYLoc+250);
  water.resize(100, 200);
  image(hay, hayX+470, hayYLoc+320);  
  text("Feed the cow", width/2, height/2+220);
  if (mouseX<=width/5) {
    text("Great, thank you for the water, can I have some food now!", 
      width/2, height/2);      
  }
  if (mouseX>=width-200) {
    text("Yummy, thank you for the food, can I have some water now!", 
      width/2, height/2);      
  }
}
