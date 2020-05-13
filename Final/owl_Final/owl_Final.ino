//Shequana_Garnett/Final/Owl
#include <Stepper.h>
int photoResistorPin = A0;
int stepperRot = 200;
const int LEDa = 5;
const int LEDb = 4;
bool light=false;
Stepper stepper(stepperRot, 6, 9, 10, 11);

void setup()
{  
  pinMode(LEDa, OUTPUT); // set pin as output
  pinMode(LEDb, OUTPUT); // set pin as output
  stepper.setSpeed(60);
  Serial.begin(9600);
}

void loop() {
  int photoPinVal = analogRead(photoResistorPin);
  Serial.println(photoPinVal);
  if (photoPinVal < 1) {
    light=true;
    if(light==true)
    {digitalWrite(LEDa, HIGH);
    digitalWrite(LEDb, HIGH);    
    stepperFun();   
delay(100);}
else{light=false;}
  }  else
// if   (photoPinVal > 2) 
{light=false;
  //{   
  if(light==false){
    digitalWrite(LEDa, LOW);
     digitalWrite(LEDb, LOW);
    stepperRot = 0;
         delay(100);}}
  //}

}



void stepperFun() {
  for (stepperRot = 0; stepperRot < 180; stepperRot++) {
    stepper.step(stepperRot); 
     
    delay(10);
  }
  for (stepperRot = 180; stepperRot > 0; stepperRot--) {
    stepper.step(stepperRot);
    
    delay(10);
  }
}
