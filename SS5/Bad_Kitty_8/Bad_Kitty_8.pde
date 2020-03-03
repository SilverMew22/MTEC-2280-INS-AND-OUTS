//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch

Jars[] jars=new Jars[4];

void setup() {
  size(1000, 600);
  for (int i=0; i<jars.length; i++) {
    jars[i]=new Jars();
  }
}
void draw() {
  noStroke();
  background(255);
  fill(200);
  rect(0, 400, width, height/3);
  window(width/2-200, height/2-200);
  for (int i=0; i<width; i++) {
    for (int l=0; l<height/3; l++) {
      fill(100);
      rect(i*20, l+400+2, 10, 10);
    }
  }
  couch(100);
  for (int i=0; i<jars.length; i++) {
    jars[i].makeJar(i*100+200, i);
    jars[i].makeJar(i*100+200, i+100);
    jars[i].makeJar(i*100+200, i+200);
    jars[i].makeJar(i*100+200, i+300);
    jars[i].hover(i, i, mouseX, mouseY);
    if (mouseX>i&&mouseX<i+60&&mouseY>i&&mouseY<i+60) {
      jars[i].hover(i, i++, mouseX, mouseY);
    }
  }
  kitty();
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
class Jars {
  int y;  
  int x;
  boolean fall;
  float speed;
  Jars() {
    y=0;
    x=0;
    fall=false;
    speed=1;
  }
  void makeJar(int x, int y) {    
    fill(0);
    rect(400+x, 50+y, 20, 50);
    ellipse(410+x, 100+y, 50, 50);
    ellipse(410+x, 50+y, 30, 10);
    ellipse(410+x, 125+y, 30, 10);
  }
  void hover (int x, int y, int mx, int my) {
    if (x>mx&&x<mx+x+60&&my>y&&my<y+30) {
      fall=true;
    } else {
      y++;
      fall=false;
    }
  }
}

void couch(int x) {
  rect(width/2-600+x, height/2, 400, 200, 100);
  fill(200);
  ellipse(width/2-400+x, height/2+155, 400, 100);
  fill(200);
  ellipse(width/2-200+x, height/2+100, 100, 100);
  fill(200);
  ellipse(width/2-600+x, height/2+100, 100, 100);
    fill(100);
  ellipse(width/2-200+x, height/2+100, 20, 20);
  fill(100);
  ellipse(width/2-600+x, height/2+100, 20, 20);
  if (mousePressed&&mouseX<400&&mouseX<450&&mouseY>width/3) {
    stroke(0);
    strokeWeight(.5);
    line(x+200, x+300, x+200, x+350);
    line(x+150, x+300, x+150, x+350);
    line(x+100, x+300, x+100, x+350);
  }
}
void window(int x, int y) {  
  rect(x-20, y-10, 150, 200);
  fill(255);
  rect(0+x, 0+y, 50, 50);
  rect(60+x, 0+y, 50, 50);
  rect(0+x, 60+y, 50, 50);
  rect(60+x, 60+y, 50, 50);
  rect(0+x, 120+y, 50, 50);
  rect(60+x, 120+y, 50, 50);
}
