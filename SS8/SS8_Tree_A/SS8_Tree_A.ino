//Receives data over Serial port from Processing to control 2 LEDS
//Hook up LEDs to pins 4 and 8;


byte val; // stores data received from serial port
const int LED1 = 3; // variable for which pin
const int LED2 = 5; // variable for which pin
const int LED3 = 6; // variable for which pin
const int LED4 = 9; // variable for which pin
const int LED5 = 10; // variable for which pin
const int LED6 = 11; // variable for which pin


void setup() {
  pinMode(LED1, OUTPUT); // set pin as output
  pinMode(LED2, OUTPUT); // set pin as output
  pinMode(LED3, OUTPUT); // set pin as output
  pinMode(LED4, OUTPUT); // set pin as output
  pinMode(LED5, OUTPUT); // set pin as output
  pinMode(LED6, OUTPUT); // set pin as output
  Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
  if (val == 0) { // If 0 received
    digitalWrite(LED1, LOW); // turn LEDs off
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW); // turn LEDs off
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW); // turn LEDs off
    digitalWrite(LED6, LOW);
  }
  else if (val == 1) { // If 1 received
    digitalWrite(LED1, HIGH); // turn the LED at pin 1 on
  }
  else if (val == 2) { // If 2 received
    digitalWrite(LED2, HIGH); // turn the LED at pin 2 on
  }
    else if (val == 3) { // If 1 received
    digitalWrite(LED3, HIGH); // turn the LED at pin 1 on
  }
  else if (val == 4) { // If 2 received
    digitalWrite(LED4, HIGH); // turn the LED at pin 2 on
  }
    else if (val == 5) { // If 1 received
    digitalWrite(LED5, HIGH); // turn the LED at pin 1 on
  }
  else if (val == 6) { // If 2 received
    digitalWrite(LED6, HIGH); // turn the LED at pin 2 on
  }
  delay(10); // Wait 10 milliseconds
}
