//Shequana_Garnett/week 7/move potentiometer left or right to match up shapes and make a secret image appear
import processing.serial.*; //imports Serial library from Processing
Serial myPort; 
float val=0;
float valb=0;
float shade=255;
float shader=0;
int space=150;
int top=0;
int bottom=0;

void setup() {
  size(600, 500);
  ellipseMode(CENTER);
  rectMode(CENTER);
  printArray(Serial.list()); 
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  textAlign(CENTER);
  textSize(30);
}

void draw() {
  background(50);  
   if ( myPort.available() > 0) { 
    val = myPort.read();    
  }
  println (val);   

fill (255);  
rect(width/2,height/2+space,width,150);
fill(0);
ellipse (width/2+val-200, height/2+space, 100,100); 
rect(width/2+val+200,height/2+space,100,100);
triangle(width/2-50+val,height/2+50+space,width/2+val,height/2-50+space,width/2+50+val,height/2+50+space);
valb=map(val,0,255,255,0);
fill (0);  
rect(width/2,height/2-space,width,150);
fill(255);
ellipse (width/2+valb-200, height/2-space, 100,100); 
rect(width/2+valb+250,height/2-space,50,100);
triangle(width/2-50+valb,height/2+50-space,width/2+valb,height/2-50-space,width/2+50+valb,height/2+50-space);

if (val>100&&val<150) {
    fill(255);
    text("SnowMan",width/2, height/2-50);
ellipse (width/2, height/2, 50,50); 
ellipse (width/2, height/2+50, 50,50); 
  }
if (val>25&&val<30) {
  fill(255);
    text("tree",width/2, height/2-50);   
      fill(0);
    triangle(width/2-50,height/2+50,width/2,height/2-50,width/2+50,height/2+50);
    rect(width/2,height/2+50,50,50);
  }
  if (val>220&&val<300) {
  fill(255);
    text("hat",width/2, height/2-50);   
      fill(0);
    triangle(width/2-50,height/2+50,width/2,height/2-50,width/2+50,height/2+50);
    ellipse(width/2,height/2+50,150,50);
  }
}
