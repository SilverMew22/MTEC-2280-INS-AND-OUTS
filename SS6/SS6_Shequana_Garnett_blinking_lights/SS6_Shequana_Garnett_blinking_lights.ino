//SS6_Shequana_Garnett_blinking_lights
int buttonPress = 5;
int ledPin1 = 6;
int ledPin2 = 9;
int ledPin3 = 10;
int ledPin4 = 11;

void setup() {
  Serial.begin(9600);
  pinMode(buttonPress, INPUT_PULLUP);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
}

void loop() {
  int buttonVal = digitalRead(buttonPress);
  if (buttonVal == 0) {
    //Serial.println("the button is pressed and the light is on");
    digitalWrite(ledPin1, HIGH);
    delay(100);
    digitalWrite(ledPin1, LOW);
    delay(100);
    digitalWrite(ledPin1, HIGH);
    delay(100);
    digitalWrite(ledPin1, LOW);
    delay(100);
    digitalWrite(ledPin1, HIGH);
    delay(100);
    digitalWrite(ledPin1, LOW);
    delay(100);
    digitalWrite(ledPin1, HIGH);
    delay(100);
    digitalWrite(ledPin1, LOW);
    delay(100);
    /////////////////////////////////////////////
    digitalWrite(ledPin2, HIGH);
    delay(500);
    digitalWrite(ledPin2, LOW);
    delay(200);
    digitalWrite(ledPin2, HIGH);
    delay(500);
    digitalWrite(ledPin2, LOW);
    delay(200);
    ////////////////////////////////////////////
    digitalWrite(ledPin3, HIGH);
    delay(700);
    digitalWrite(ledPin3, LOW);
    delay(800);
    digitalWrite(ledPin3, HIGH);
    delay(700);
    digitalWrite(ledPin3, LOW);
    delay(800);
    ////////////////////////////////////////////
    digitalWrite(ledPin4, HIGH);
    delay(1000);
    digitalWrite(ledPin4, LOW);
    delay(2000);
    digitalWrite(ledPin4, HIGH);
    delay(1000);
    digitalWrite(ledPin4, LOW);
    delay(2000);
  }
  else {
    digitalWrite(ledPin1, LOW);
    digitalWrite(ledPin2, LOW);
    digitalWrite(ledPin3, LOW);
    digitalWrite(ledPin4, LOW);
  }
}
