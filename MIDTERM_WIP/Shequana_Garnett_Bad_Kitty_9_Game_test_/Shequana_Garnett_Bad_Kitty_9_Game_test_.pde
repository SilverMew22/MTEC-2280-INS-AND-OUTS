float move=0;
//float test2=255;
int row=4;
int col=4;

//jars
Jar[][] jar= new Jar[row][col];
//class
class Jar {
  float w;
  float h;
  int dia=50;
  float b =50;
  int fader=255;
  boolean fadeout;
  Jar(float tempH, float tempW) {
    w=tempW;
    h=tempH;
  }
  void display(float w, float h) {
    fill(0, 0, 0, fader);
    rect(400+w+move, 50+h, dia-30, dia);       
    ellipse(410+w+move, 50+h, dia-20, dia-40); 
    ellipse(410+w+move, 125+h, dia-20, dia-40); 
    //rounded base
    ellipse(410+w+move, 100+h, dia, dia);
    //base
    fill(200,200,200,fader);
    ellipse(410+w+move+15, 100+h, dia-40, dia-30);
  }
  void fade() {
    if (mouseX>w-dia/2&&mouseX<w+dia/2&&mouseY>h-dia/2&&mouseY<h+dia/2)
    {
      fadeout=true;
    }    
    if (fadeout==true) {     
      fader--;
    }
  }
}

void setup() {
  size(1000, 600);  
  textAlign(CENTER);
  textSize(100);
  for (int i=0; i<row; i++) {
    for (int j=0; j<col; j++) {
      jar[i][j]= new Jar(i*100, j*100);
    }
  }
}
void draw() {  
  background(255);
  noStroke();  
  for (int i=0; i<row; i++) {
    for (int j=0; j<col; j++) {
      jar[i][j].display(i*100+200, j*100);
      jar[i][j].fade();
    }
  }
}
