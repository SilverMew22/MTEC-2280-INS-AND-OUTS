import processing.serial.*;
Serial myPort;
int shine=100;
int shineA=100;
int shineB=100;
int shineC=100;
int shineD=100;
int shineE=100;
int shineF=100;

void setup() {
  size(900, 900); 
  textSize (22);
  textAlign (CENTER);
ellipseMode(CENTER);
rectMode(CENTER);
noStroke();
  //set up Serial communication
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[0]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}
void draw() {
  background (100);
    fill(255);
  text ("Light the christmas tree by panning over lights", width/2, height/10);

  ////////////////////tree
  fill(50);
  rect(width/2,height/2+300,100,200);
  fill(0);
  triangle(width/2-150,height/2,width/2,height/2-200,width/2+150,height/2);
  triangle(width/2-250,height/2+150,width/2,height/2-100,width/2+250,height/2+150);
  triangle(width/2-350,height/2+300,width/2,height/2-100,width/2+350,height/2+300); 
  /////////////////////lights  
  /////////////////////1st row
  lightGreen(0,-100,shineA);
  if(mouseX>420&&mouseX<475&&mouseY>330&&mouseY<375){
  shineA=210;
   myPort.write(1); 
   println ("1");
  }
  /////////////////2nd row
  lightRed(-100,100,shineB);
   if(mouseX>320&&mouseX<375&&mouseY>525&&mouseY<575){
  shineB=210;
   myPort.write(2); 
   println ("2");
  }
  lightGreen(100,100,shineC);
   if(mouseX>525&&mouseX<575&&mouseY>525&&mouseY<575){
  shineC=210;
   myPort.write(3); 
   println ("3");
  }
  /////////////////3rd row
    lightGreen(-250,250,shineD);
   if(mouseX>175&&mouseX<225&&mouseY>675&&mouseY<725){
  shineD=210;
   myPort.write(4); 
   println ("4");
  }
    lightRed(0,250,shineE);
   if(mouseX>425&&mouseX<475&&mouseY>675&&mouseY<725){
  shineE=210;
   myPort.write(5); 
   println ("5");
  }
    lightRed(250,250,shineF);
   if(mouseX>670&&mouseX<700&&mouseY>675&&mouseY<725){
  shineF=210;
   myPort.write(6); 
   println ("6");
  }
  if (mouseX>320&&mouseX<580&&mouseY>125&&mouseY<175){
    myPort.write(0); //send a 0
    shineA=100;
shineB=100;
 shineC=100;
 shineD=100;
 shineE=100;
 shineF=100;
    println ("0");
  }
  println(mouseX);
  println(mouseY);
  fill(250);
  rect(width/2,height/2-300,250,50,50);
  fill(0);
  text ("Turn off the lights", width/2, height-740);
}
void lightRed(int x, int y, int shine){
fill(shine);
ellipse(width/2+x,height/2+y,50,50);
fill(255,255,255,200);
ellipse(width/2+10+x,height/2-10+y,20,20);
fill(200);
rect(width/2+x,height/2-30+y,30,10);
if(shine>200){
fill(shine,0,0,100);
ellipse(width/2+x,height/2+y,100,100);
}
}

void lightGreen(int x, int y, int shine){
fill(shine);
ellipse(width/2+x,height/2+y,50,50);
fill(255,255,255,200);
ellipse(width/2+10+x,height/2-10+y,20,20);
fill(200);
rect(width/2+x,height/2-30+y,30,10);
if(shine>200){
fill(0,shine,0,100);
ellipse(width/2+x,height/2+y,100,100);
}}
