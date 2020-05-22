import processing.serial.*;
Serial myPort;
int wingSpread=150;
int wingLift=50;
int eyeTurnL=0;
int eyeTurnR=0;
int eyeTurnB=0;
int eyecolor=50;

void setup() {
  size(1000, 800); 
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[0]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

void draw() {
  background(100);
  wallpaper();
  floor();
  //window(-300, -200);
  owl(0, 0);
  darkness();
  glow(0, -100);
  border();
  leftArrow(200, -100);
  rightArrow(-200, -100);
  println(mouseX);
  println(mouseY);
}
//////////////////////////////////////////owl
void owl(int x, int y) {
  //////////////////////////////////////////feet
  ///////////////////////////////////////////left
  fill(255);
  rect(width/2-50,height/2+160,10,40,100);
  rect(width/2-60,height/2+160,10,40,100);
  rect(width/2-70,height/2+160,10,40,100);
    ///////////////////////////////////////////right
  rect(width/2+50,height/2+160,10,40,100);
  rect(width/2+60,height/2+160,10,40,100);
  rect(width/2+70,height/2+160,10,40,100);
  //////////////////////////////////////////body
  fill(50);  
  rect(width/2+x, height/2+y+50, 250, 200, 100);
  /////////////////////////////////////////////head
  rect(width/2+x, height/2+y-100, 250, 200, 100);
  //////////////////////////eyes
  fill(255);
  ellipse(width/2-50+eyeTurnL, height/2-150, 50, 50);
  ellipse(width/2-50+eyeTurnL-30, height/2-130, 50, 50);
  ellipse(width/2-50+eyeTurnL-40, height/2-100, 50, 50);
  ellipse(width/2-50+eyeTurnL, height/2-100, 70, 70);  
  fill(255);
  ellipse(width/2-50+eyeTurnR+100, height/2-150, 50, 50);
  ellipse(width/2-50+eyeTurnR+130, height/2-130, 50, 50);
  ellipse(width/2-50+eyeTurnR+140, height/2-100, 50, 50);
  ellipse(width/2-50+eyeTurnR+100, height/2-100, 70, 70);
  //////////////////eyes
  fill(eyecolor);
  ellipse(width/2-50+eyeTurnR+100, height/2-100, 50, 50);
  ellipse(width/2-50+eyeTurnL, height/2-100, 50, 50);
  fill(255);
  triangle(width/2-20+eyeTurnR, height/2-50, width/2+eyeTurnR, height/2-10, width/2+20+eyeTurnR, height/2-50);
  //////////////////////////////////wings
  ellipse(width/2-100, height/2+50, wingLift, wingSpread);
 ellipse(width/2+100, height/2+50, wingLift, wingSpread);
  if (mousePressed&&mouseX>650&&mouseX<800&&mouseY>195&&mouseY<400) {
           myPort.write(1); 
   println ("1");
    if (eyeTurnL<50) {
      eyeTurnR++;
      eyeTurnL++;
      eyecolor=color(255, 255, 0);

    }  
  }  
    if (mousePressed&&mouseX>200&&mouseX<350&&mouseY>195&&mouseY<400) {
       myPort.write(2); 
   println ("2");
    if (eyeTurnL>-30) {
      eyeTurnR--;
      eyeTurnL--;
      eyecolor=color(255, 255, 0);
     
    }   
  }
   if (mousePressed != true){     
   myPort.write(3); 
   println ("3");
   eyecolor=50;
    }
}
//////////////////////////////////////////////////window
void window(int x, int y) {
  fill(0);
  ellipse(width/2+x, height/2+y, 200, 200);
  rect(width/2+x, height/2+y+100, 200, 200);
  fill(250);
  ellipse(width/2+x, height/2+y, 180, 180);
  rect(width/2+x, height/2+y+100, 180, 180);
}
//////////////////////////////////////////////////wallpaper
void wallpaper() {
  for (int i=0; i<=64; i++) {
    for (int l=0; l<=50; l++) {
      fill(255);
      ellipse(i*25, l*25+100, 10, 5);
      ellipse(i*25, l*25+100, 5, 10);
    }
  }
}
///////////////////////////////////////////floor
void floor() {
  for (int i=0; i<=64; i++) {
    for (int l=0; l<=400; l++) {
      fill(87, 145, 117);
      ellipse(i*20, l*10+550, 20, 20);
    }
  }
}
///////////////////////////////////////////////border
void border() {
  fill(10);
  rect(500, 0, 1000, 200);
  rect(500, 800, 1000, 200);
}
/////////////////////////////////darkness
void darkness() { 
    fill(0, 0, 0, 150);  
    rect(500, 500, 1000, 1000);
}
///////////////////////////glow
void glow(int x, int y) { 
  if (mousePressed&&mouseX>200&&mouseX<350&&mouseY>195&&mouseY<400||mousePressed&&mouseX>650&&mouseX<800&&mouseY>195&&mouseY<400) {
for (int i=0; i<=15; i++) {
      fill(255, 255, 255, i);
      ellipse(width/2+x, height/2+y, i*50, i*50);
    }
  }
}

/////////////////////////////////////left arrow
void leftArrow(int x, int y) {
  fill(100);
  rect(width/2+x, height/2+y, 120, 90);  
  fill(200);
  rect(width/2+x, height/2+y, 100, 70);
  triangle(width/2+x, height/2-100+y, width/2+100+x, height/2+y, width/2+x, height/2+100+y);
}
/////////////////////////////////////right arrow
void rightArrow(int x, int y) {
  fill(100);
  rect(width/2+x, height/2+y, 120, 90);  
  fill(200);
  rect(width/2+x, height/2+y, 100, 70);
  triangle(width/2+x, height/2-100+y, width/2-100+x, height/2+y, width/2+x, height/2+100+y);
}
