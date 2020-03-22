//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch
float move=0;
float paw;
float c=170;
float body=80;
boolean pounce;
float scratch=0;

void setup() {
  size(1000, 600);
  pounce=false;
}
void draw() {
  noStroke();
  background(0);
  border();
  fill(100);
  rect(0+move-250, 400, 1300, height/3);
  window(width/2-200, height/2-250);
  window(width/2-400, height/2-250);
  window(width/2-600, height/2-250);
  //carpet
  for (int i=0; i<=43; i++) {
    for (int l=0; l<=43; l++) {
      fill(255);
      ellipse(i*30+move-250, l*30+405, 12, 6);
      ellipse(l*30+move-250, i*30+405, 6, 12);
    }
  }
  bed(-450, -50);
  dresser(20, +10);
  cat();
  if (mousePressed) {
    pounce=true;
  } else {
    pounce=false;
  }
  if (scratch>30) {
    scratch=10;
  }
  moving();
}


void cat() {
  if (pounce==false) {
    stroke(0);
    strokeWeight(17);
    fill(0);
    //feet
    line(mouseX, mouseY-70, mouseX, mouseY);
    line(mouseX-20, mouseY-70, mouseX-20, mouseY);
    line(mouseX-100, mouseY-70, mouseX-100, mouseY);
    line(mouseX-120, mouseY-70, mouseX-120, mouseY);
    //tail
    line(mouseX-90, mouseY-70, mouseX-130, mouseY-250);
    head(0, 0);
    //body
    stroke(0);
    strokeWeight(50);
    line(mouseX-90, mouseY-body, mouseX-15, mouseY-body);
    strokeWeight(17);
    fill(0);
    // circle(mouseX-80, mouseY-70, 40);
    circle(mouseX-90, mouseY-70, 40);
  }
  if (pounce==true) {
    stroke(0);
    strokeWeight(17);
    fill(0);
    //feet
    line(mouseX-10, mouseY-70, mouseX+scratch++, mouseY);    
    //elbow
    line(mouseX-50, mouseY-30, mouseX-40, mouseY-40);
    line(mouseX-50, mouseY-30, mouseX-30, mouseY);    
    line(mouseX-100, mouseY-70, mouseX-80, mouseY);
    line(mouseX-120, mouseY-70, mouseX-100, mouseY);
    //tail
    line(mouseX-100, mouseY-70, mouseX-130, mouseY-250);
    head(+20, -20);
    //body
    stroke(0);
    strokeWeight(50);
    line(mouseX-90, mouseY-body, mouseX-15, mouseY-60);
    strokeWeight(17);
    fill(0);
    //circle(mouseX-80, mouseY-65, 40);
    circle(mouseX-90, mouseY-65, 40);
  }
}
void head(int a, int b) {
  //head
  //left ear
  triangle(mouseX-50+b, mouseY-240+a, mouseX-30+b, mouseY-c+a, mouseX+40+b, mouseY-c+a);
  //right ear
  triangle(mouseX+60+b+20, mouseY-240+a, mouseX+50+b+15, mouseY-c+a, mouseX+b, mouseY-c+a);
  circle(mouseX+20+b, mouseY-150+a, 100);
  //eyes
  //lefteye
  strokeWeight(2);
  fill(255);
  circle(mouseX+b, mouseY-150+a, 40);
  //right eye
  circle(mouseX+55+b, mouseY-150+a, 40);
  if (mousePressed) {
    //left eyelid
    fill(0);
    circle(mouseX+b+15, mouseY-160+a, 40);
    //right eyelid
    circle(mouseX+40+b, mouseY-160+a, 40);
  }
}



void window(int x, int y) {  
  noStroke();
  fill(140);
  rect(x-20+move, y-10, 150, 200);
  fill(255);
  rect(0+x+move, 0+y, 50, 50);
  rect(60+x+move, 0+y, 50, 50);
  rect(0+x+move, 60+y, 50, 50);
  rect(60+x+move, 60+y, 50, 50);
  rect(0+x+move, 120+y, 50, 50);
  rect(60+x+move, 120+y, 50, 50);
}
//void scratch(int x) {
//  stroke(0);
//  strokeWeight(.5);
//  line(x+200+move, x+300+move, x+250+move, x+350+move);
//  line(x+210+move, x+300+move, x+260+move, x+350+move);
//  line(x+220+move, x+300+move, x+270+move, x+350+move);
//}


void moving() {
  if (keyPressed) {
    if (key== 'a') {
      move+=5;
    } else if (key=='d') {
      move-=5;
    }
  }
}

void border() {
  fill(255);
  rect(-250+move, 0, 1300, 600);
}

void bed(int x, int y) {
  fill(50);
  ellipse(width/2-200+x+move, height/2+50+y, 100, 300);
  ellipse(width/2+400+x+move, height/2+100+y, 100, 200);
  //bed
  fill(200);
  rect(width/2-200+x+move, height/2+y, 600, 200, 100);  
  //sheet
  fill(150);  
  rect(width/2-100+x+move, height/2+y, 500, 200, 100);
  //base
  fill(50);
  rect(width/2-200+x+move, height/2+100+y, 600, 100);  
  for (int a=0; a<=width/3; a+=110) {
    fill(150);  
    ellipse(460+a+x+move, height/2+100+y, 110, 50);
  }
}
void dresser(int x, int y) {
  fill(100);
  ellipse(width/2+275+x+move, height/2-200+y, 300, 400);
  fill(240);
  ellipse(width/2+275+x+move, height/2-200+y, 280, 380);
  fill(175);  
  rect(width/2+125+x+move, height/2-70+y, 300, 200);
  fill(105);  
  rect(width/2+100+x+move, height/2-70+y, 350, 10);
}
