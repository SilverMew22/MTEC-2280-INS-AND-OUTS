//move cat over jars to knock them down

Jars[] jars=new Jars[5];

void setup() {
  size(1000, 600);
  for (int i=0; i<jars.length; i++) {
    jars[i]=new Jars();
  }
}
void draw() {
  background(255);
  for (int i=0; i<jars.length; i++) {
    jars[i].makeJar(i*100, i);
    jars[i].makeJar(i*100, i+100);
    jars[i].makeJar(i*100, i+200);
    jars[i].makeJar(i*100, i+300);
    jars[i].hover(i,i,mouseX,mouseY);
    if(mouseX>i&&mouseX<i+60&&mouseY>i&&mouseY<i+60){
    jars[i].hover(i,i++,mouseX,mouseY);
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
  void hover (int x,int y,int mx,int my) {
    if(x>mx&&x<mx+x+60&&my>y&&my<y+30){
    fall=true;
  }else{y++;
fall=false;
}
  
}}
