//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch
Magnets[] magnets=new Magnets[5];
float move=0;

void setup() {
  size(1000, 600);
  for (int i=0; i<=4; i++) {
    magnets[i]=new Magnets();
  }
}
void draw() {
  noStroke();
  background(255);
  fill(200);
  rect(0+move, 400, width, height/3);
  window(width/2-200, height/2-200);
  window(width/2-400, height/2-200);
  window(width/2-600, height/2-200);
  for (int i=0; i<width; i++) {
    for (int l=0; l<height/3; l++) {
      fill(100);
      rect(i*20+move, l+400+2, 10, 10);
    }
  }
  counter(100);
  frige();
  for (int i=0; i<=4; i++) {
    for (int j=0; j<=4; j++) {
      magnets[i]=new Magnets();
    }
  }
  kitty();
  moving();
}


void kitty() {
  fill(0);
  ellipse(mouseX, mouseY, 100, 100);
  triangle(mouseX-50, mouseY-100, mouseX-50, mouseY, mouseX, mouseY);
  triangle(mouseX+50, mouseY-100, mouseX+50, mouseY, mouseX, mouseY);
  rect(mouseX-100, mouseY+30, 100, 50, 20);
  rect(mouseX-100, mouseY-100, 10, 250, 20);
  rect(mouseX-25, mouseY+50, 10, 100, 20);
  rect(mouseX-50, mouseY+50, 10, 100, 20);
  rect(mouseX-75, mouseY+50, 10, 100, 20);
  fill(255);
  ellipse(mouseX-10, mouseY, 30, 30);
  ellipse(mouseX+30, mouseY, 30, 30);
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
  rect(width/2-500+x+move, height/2, 400, 200);
  fill(150);  
  rect(width/2-510+x+move, height/2, 420, 20, 200);
  fill(250);  
  if (mousePressed&&mouseX<400&&mouseX<450&&mouseY>width/3) {
    scratch(50);
    scratch(0);
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
  if (mouseX<=width/1.5) {
    //move+=1;
  } else if (mouseX>=width/3) {
    // move-=1;
  } else if (mouseY>=height/1.5&&mouseX<=height/2.9) {
    move=0;
  }
}
