//Shequana_Garnett/Final/Owl
#include <Stepper.h>
const int photoResistorPin = A0;
int stepperRot = 200;
const int LEDa = 5;
const int LEDb = 4;
byte val; // stores data received from serial port
Stepper stepper(stepperRot, 6, 9, 10, 11);

void setup()
{  
  pinMode(LEDa, OUTPUT); // set pin as output
  pinMode(LEDb, OUTPUT); // set pin as output
  stepper.setSpeed(60);
  Serial.begin(9600);
}

void loop() {
    if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
  int photoPinVal = analogRead(photoResistorPin);
  Serial.println(photoPinVal);
  if (photoPinVal <= 0 || val == 1) {
    {digitalWrite(LEDa, HIGH);
    digitalWrite(LEDb, HIGH);    
    stepperFun();
    }
  }  else if(val == 0){
    digitalWrite(LEDa, LOW);
     digitalWrite(LEDb, LOW);
    stepperRot = 0;
        }
        else {
    digitalWrite(LEDa, LOW);
     digitalWrite(LEDb, LOW);
    stepperRot = 0;
        }
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
