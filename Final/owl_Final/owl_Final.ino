//Shequana_Garnett/Final/Owl
#include <Stepper.h>
int photoResistorPin = A0;
int stepperRot = 200;
const int LEDa = 5;
const int LEDb = 4;
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
   map(photoPinVal, 0, 20, 0, 255);
  if (photoPinVal <= 2) {
    { digitalWrite(LEDa, HIGH);
      digitalWrite(LEDb, HIGH);  
      //stepper.step(stepperRot+1);     
    }
  } else  {
    digitalWrite(LEDa, LOW);
    digitalWrite(LEDb, LOW);    
  //stepper.step(stepperRot);   
  }}





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
