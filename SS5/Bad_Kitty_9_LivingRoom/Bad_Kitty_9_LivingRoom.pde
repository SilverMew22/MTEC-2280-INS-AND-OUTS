//move cat over jars to knock them down
//hover cat over couch and mouse press to scratch
Jars[] jars=new Jars[4];
float move=0;
float sholder= 70;
float foot =130;
float swipe=0;
float tipX=.01;
float tipY=.01;
void setup() {
  size(1000, 600);
  for (int i=0; i<=3; i++) {
    jars[i]=new Jars();
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
  for (int i=0; i<=64; i++) {
    for (int l=0; l<height/3; l++) {
      fill(100);
      rect(i*20+move-250, l+400+2, 10, 10);
    }
  }
  couch(100);
  shelf();
  for (int i=0; i<=3; i++) {
      jars[i].display(i*100+200,i);
      //jars[i].makeJar(i*100+200, i+100);
      //jars[i].makeJar(i*100+200, i+200);
      //jars[i].makeJar(i*100+200, i+300);
      //jars[i].hover(i, i, mouseX, mouseY);
      if (mouseX>i&&mouseX<i+60&&mouseY>i&&mouseY<i+60) {
        jars[i].fall();      
    }
  }
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
class Jars {
  int y;  
  int x;
  float speed;
  Jars() {
    y=0;
    x=0;
    speed=1;
  }
  void display(int x,int y) {    
    fill(0);
    rect(400+x+move, 50+y, 20, 50);
    ellipse(410+x+move, 100+y, 50, 50);
    ellipse(410+x+move, 50+y, 30, 10);
    ellipse(410+x+move, 125+y, 30, 10);
  }
  void fall() {  
     if (mouseX>=x&&mouseX<=x+50&&mouseY>y&&mouseY<y+50) {
     y+=10;
    }
  }
}
void couch(int x) {
  rect(width/2-600+x+move, height/2, 400, 200, 100);
  fill(200);
  ellipse(width/2-400+x+move, height/2+155, 400, 100);
  fill(200);
  ellipse(width/2-200+x+move, height/2+100, 100, 100);
  fill(200);
  ellipse(width/2-600+x+move, height/2+100, 100, 100);
  fill(100);
  ellipse(width/2-200+x+move, height/2+100, 20, 20);
  fill(100);
  ellipse(width/2-600+x+move, height/2+100, 20, 20);
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
void shelf() {
  fill(160);
  rect(width/2+50+move, height/2-400, 400, 600);
  fill(120);
  rect(width/2+65+move, height/2-175, 380, 10);
  rect(width/2+65+move, height/2-175+100, 380, 10);
  rect(width/2+65+move, height/2-175+200, 380, 10);
  rect(width/2+65+move, height/2-175+300, 380, 10);
}

void moving(){
  if (keyPressed) {
      if (key== 'a') {
        move+=5;
      } else if (key=='d') {
        move-=5;
      }
    }
}

void border(){
  fill(0);
  rect(-250+move,0,1400,700);
  fill(255);
  rect(-250+move,0,1300,600);
}
