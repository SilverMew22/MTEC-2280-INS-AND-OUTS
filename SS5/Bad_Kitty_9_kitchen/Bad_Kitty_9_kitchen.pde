//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch
Magnets[] magnets=new Magnets[5];
float move=0;
float paw;
float c=170;
float body=80;
boolean pounce;
float scratch=0;

void setup() {
  size(1000, 600);
    pounce=false;
  for (int i=0; i<=4; i++) {
    magnets[i]=new Magnets();
  }
}
void draw() {
  noStroke();
  background(0);
  border();
  fill(200);
  rect(0+move-250, 400, 1300, height/3);
  window(width/2-200, height/2-250);
  window(width/2-400, height/2-250);
  window(width/2-600, height/2-250);
  //floor
  for (int i=0; i<=65; i++) {
    for (int l=0; l<=65; l++) {
      fill(100);
      ellipse(i*20+move-250, l*10+405, 4, 4);
      ellipse(l*20+move-250, i*50+405, 10, 10);
    }
  }
  counter(-150);
  frige();
  for (int i=0; i<=4; i++) {
    for (int j=0; j<=4; j++) {
      magnets[i]=new Magnets();
    }
  }
  plate(100, 250);
  plate(200, 250);
  plate(300, 250);
  sink(-130, 270);
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
     circle(mouseX-90,mouseY-70,40);
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
     circle(mouseX-90,mouseY-65,40);
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

class Magnets {
  int y;  
  int x;
  float speed;
  Magnets() {
    y=0;
    x=0;
    speed=1;
  }
  void place(int x, int y) {    
    fill(0);
    ellipse(x+move +int(random(1, 1)), y+int(random(1, 1)), 50, 50);
  }
  void hover (int x, int y, int mx, int my) {
    if (x>mx&&x<mx+x+60&&my>y&&my<y+30) {
      y++;
    }
  }
}
void counter(int x) {
  rect(width/2-500+x+move, height/2, 500, 200);
  fill(150);  
  rect(width/2-510+x+move, height/2, 520, 20, 200);
  fill(250);
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
void scratch(int x) {
  stroke(0);
  strokeWeight(.5);
  line(x+200+move, x+300+move, x+250+move, x+350+move);
  line(x+210+move, x+300+move, x+260+move, x+350+move);
  line(x+220+move, x+300+move, x+270+move, x+350+move);
}
void frige() {
  fill(160);
  rect(width/2+50+move, height/2-300, 300, 500, 100);
  fill(190);
  rect(width/2+60+move, height/2-280, 280, 200, 50);
  rect(width/2+60+move, height/2-70, 280, 240, 50);
  rect(width/2+60+move, height/2-240, 280, 160);
  rect(width/2+60+move, height/2-70, 280, 200);
  fill(160);
  rect(width/2+70+move, height/2-30, 20, 50, 100);
  rect(width/2+70+move, height/2-150, 20, 50, 100);
}

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

void plate(int x, int y) {
  fill(240);
  ellipse(x+move, y, 110, 110);
  fill(230);
  ellipse(x+move, y, 70, 70);
};

void sink(int x, int y) {
  //base
  rect(x+move+10+50, y-20, 20, 50, 10);
  //neck
  rect(x+move+10+50, y-20, 50, 20, 100);
  fill(170);
  rect(x+move, y+20, 150, 10);
  //knobs
  ellipse(x+move+10, y+5, 40, 30);
  ellipse(x+move+140, y+5, 40, 30);
  fill(240);
  ellipse(x+move+10, y, 20, 15);
  ellipse(x+move+140, y, 20, 15);
}
