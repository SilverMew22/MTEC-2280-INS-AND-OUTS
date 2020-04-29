boolean monster;
void setup(){
 size(1000,800); 
 noStroke();
 rectMode(CENTER);
 ellipseMode(CENTER);

}
void draw(){
background(200);
wallpaper();
floor();
window(-300,-200);
bed(50);
light(200,100);
darkness();
glow(200,100);
border();
monster=false;
}
/////////////////////////////////bed
void bed(int y){
  ///base
fill(100);  
rect(width/2,height/2+40+y,340,50);
///left leg
fill(100);  
rect(width/2-150,height/2+100+y,30,100);
///left leg
fill(100);  
rect(width/2+150,height/2+100+y,30,100);
///pillow
fill(250);  
rect(width/2,height/2-60+y,300,100,50);
///sheet
fill(150);  
rect(width/2,height/2+y,340,100,50);
}
//////////////////////////////////////////////////window
void window(int x, int y){
fill(0);
ellipse(width/2+x,height/2+y,200,200);
rect(width/2+x,height/2+y+100,200,200);
fill(250);
ellipse(width/2+x,height/2+y,180,180);
rect(width/2+x,height/2+y+100,180,180);
}
void chest(){

}
void child(){

}
//////////////////////////////////////////////////wallpaper
void wallpaper(){
for (int i=0; i<=64; i++) {
    for (int l=0; l<=50; l++) {
      fill(100);
      ellipse(i*25, l*25+100, 10, 5);
      ellipse(i*25, l*25+100, 5, 10);
    }
  }
}
///////////////////////////////////////////floor
void floor(){
for (int i=0; i<=64; i++) {
    for (int l=0; l<=400; l++) {
      fill(50);
      ellipse(i*20, l*10+550, 20,20);
    }
  }
}
///////////////////////////////////////////////border
void border(){
fill(10);
rect(500,0,1000,200);
rect(500,800,1000,200);
//rect(0,height,width,height/7);
}
////////////////////////////////////////////////timer
/////////////////////////////////////////////////light
void light(int x, int y){
  //board
fill(120);  
rect(width/2+x,height/2+y,50,70);
 //plug
fill(220);  
rect(width/2+x,height/2+y+10,20,40,50);
//lightbulb
fill(0);  
ellipse(width/2+x,height/2+y,30,30);
//eye left
fill(255);  
ellipse(width/2+x-5,height/2+y,10,10);
//eye right
fill(255);  
ellipse(width/2+x+5,height/2+y,10,10);
//eye left
fill(0);  
ellipse(width/2+x-15,height/2+y-20,20,20);
//eye right
fill(0);  
ellipse(width/2+x+15,height/2+y-20,20,20);
}
////////////////////////////////monster
/////////////////////////////////darkness
void darkness(){ 
if(mousePressed!=true){  
monster=true;  
fill(0,0,0,150);  
rect(500,500,1000,1000);}
}
///////////////////////////glow
void glow(int x, int y){ 
if(mousePressed==true){
  monster=false;
  fill(0,0,0,150);  
rect(500,500,1000,1000);
for (int i=0; i<=15; i++) {
  fill(255,255,255,i);
ellipse(width/2+x,height/2+y,i*50,i*50);  
  }
  }
}
