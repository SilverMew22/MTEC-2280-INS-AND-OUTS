const int LED = 11;  //LED pin
const int potPin = A0;  //potentiometer middle pin
int val = 0; // to track potentiometer reading

void setup() {
  pinMode (potPin, INPUT);
  pinMode (LED, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  val = analogRead(potPin);      
  int potPinMap = map(val,0,1023,0,255);   
  analogWrite (LED, potPinMap);    
  //Serial.println (potPinMap);  
  Serial.write(potPinMap);
  delay(200);
}
