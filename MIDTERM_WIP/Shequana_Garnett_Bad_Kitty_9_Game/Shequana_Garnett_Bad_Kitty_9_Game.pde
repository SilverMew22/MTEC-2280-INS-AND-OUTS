int scene=1;
float expand=0;
float move=0;
float paw;
float c=170;
float body=80;
boolean pounce;
float scratch=0;
int score;
float fall;
void setup() {
  size(1000, 600);  
  textAlign(CENTER);
  textSize(100);
  pounce=false;
}
void draw() {  
  background(0);
  if (scene!=4) {  //if scene does not = 3
    expand=0;  //reset value of expand
  }
  if (scene==1) {
    scene1();
    button(-480, "START(1)", 255);
    button(-250, "KITCHEN(2)", 100);
    button(-20, "LIVINGROOM(3)", 100);
    button(210, "BEDROOM(4)", 100);
  } else if (scene==2) {
    scene2();
    button(-480, "START(1)", 100);
    button(-250, "KITCHEN(2)", 255);
    button(-20, "LIVINGROOM(3)", 100);
    button(210, "BEDROOM(4)", 100);
  } else if (scene==3) {
    scene3();
    button(-480, "START(1)", 100);
    button(-250, "KITCHEN(2)", 100);
    button(-20, "LIVINGROOM(3)", 255);
    button(210, "BEDROOM(4)", 100);
  } else if (scene==4) {
    scene4();
    button(-480, "START(1)",100);
    button(-250, "KITCHEN(2)", 100);
    button(-20, "LIVINGROOM(3)", 100);
    button(210, "BEDROOM(4)", 255);
  }  
  if (scene!=1) {
scorePos(200);
  }
  /*
  //drop_object_to_keep_score
   fill(30, 40, 50);
   ellipse(width/2, height/2+fall, 200, 200);
   if (mousePressed) {
   fall=400;
   }
   if (fall>200) {
   score++;
   }*/
}

void keyPressed() {
  if (key== '1') {
    scene=1;
  } else if (key== '2') {
    scene=2;
  } else if (key=='3') {
    scene=3;
  } else if (key=='4') {
    scene=4;
  }
}
void scene1() {
  fill(100);
  rect(0, 0, 1000, 600);
  textSize(200);
  fill(255);
  text("Bad Kitty", width/2, height/2);
  //cat
  fill(0);
  //ears
  triangle(mouseX-100, mouseY-300, mouseX-150, mouseY, mouseX, mouseY);
  triangle(mouseX+100, mouseY-300, mouseX+150, mouseY, mouseX, mouseY);
  //body
  triangle(mouseX, height, height, height, mouseX, mouseY);
  circle(mouseX, mouseY, 300);
  fill(255);
  circle(mouseX-80, mouseY, 100);
  circle(mouseX+80, mouseY, 100);
}
void scene2() {
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
//move left of right
void moving() {
  if (keyPressed) {
    if (key== 'a') {
      move+=5;
    } else if (key=='d') {
      move-=5;
    }
  }
}
//move left of right
//border
void border() {
  fill(255);
  rect(-250+move, 0, 1300, 600);
}
//border
//window
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
//window
//kitchen
void counter(int x) {
  rect(width/2-500+x+move, height/2, 500, 200);
  fill(150);  
  rect(width/2-510+x+move, height/2, 520, 20, 200);
  fill(250);
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
void plate(int x, int y) {
  fill(240);
  ellipse(x+move, y, 110, 110);
  fill(230);
  ellipse(x+move, y, 70, 70);
}
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
  //kitchen
} 

void scene3() {
  background(0);
  noStroke();  
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
    //jars[i].display(i*100+200,i);
    //jars[i].makeJar(i*100+200, i+100);
    //jars[i].makeJar(i*100+200, i+200);
    //jars[i].makeJar(i*100+200, i+300);
    //jars[i].hover(i, i, mouseX, mouseY);
    if (mouseX>i&&mouseX<i+60&&mouseY>i&&mouseY<i+60) {
      //jars[i].fall();
    }
  }
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
class Jars {
  int y;  
  int x;
  float speed;
  Jars() {
    y=0;
    x=0;
    speed=1;
  }
  void display(int x, int y) {    
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

void scene4() { 
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
void button(int x, String scene, int shader) {
  noStroke();
  fill(200);
  rect(width/2-10+x, height/2+240, 220, 70);
  fill(0);
  rect(width/2+x, height/2+250, 200, 50);
  textSize(20);
  fill(shader);
  text(scene, width/2+100+x, height/2+290);
}
void scorePos(int a){
    fill(0,0,0,100);
    ellipse(width/2+a,height/4-120,400,100);
    textSize(50);
    fill(255);   
    text("score: " + score + " /100", width/2+a, height/4-100);
}

/*void mousePressed() {
 score++;
 }
 
 void fall() {
 fall=fall++;
 }*/
