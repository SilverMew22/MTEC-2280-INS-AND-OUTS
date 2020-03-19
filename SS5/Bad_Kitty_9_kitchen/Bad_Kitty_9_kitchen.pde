//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch
Magnets[] magnets=new Magnets[5];
float move=0;
float sholder= 70;
float foot =130;
float swipe=0;
float tipX=.01;
float tipY=.01;

void setup() {
  size(1000, 600);
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
  kitty();
  moving();
}


void kitty() {
  stroke(0);
  strokeWeight(17);
  //moving paw
  line(mouseX-10, mouseY+sholder, mouseX+swipe+tipX, mouseY+foot+tipY);
  //feet
  line(mouseX-30, mouseY+sholder, mouseX-30, mouseY+foot);
  line(mouseX-70, mouseY+sholder, mouseX-70, mouseY+foot);
  line(mouseX-90, mouseY+sholder, mouseX-90, mouseY+foot);
  //tail
  line(mouseX-90, mouseY+40, mouseX-90, mouseY-100);
  noStroke();
  fill(0); 
  ellipse(mouseX, mouseY, 100, 100);
  triangle(mouseX-50, mouseY-100, mouseX-50, mouseY, mouseX, mouseY);
  triangle(mouseX+50, mouseY-100, mouseX+50, mouseY, mouseX, mouseY);
  rect(mouseX-100, mouseY+30, 100, 50, 20);
  fill(255);
  ellipse(mouseX-10, mouseY, 30, 30);
  ellipse(mouseX+30, mouseY, 30, 30);  

  if (mousePressed) {
    stroke(0);
    strokeWeight(18);
    fill(0);
    //eyes
    line(mouseX, mouseY, mouseX-20, mouseY-20);
    line(mouseX+20, mouseY, mouseX+40, mouseY-20);
    swipe=20;
  } else {
    swipe=0;
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
