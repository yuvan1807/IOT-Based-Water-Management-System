int sensor = A0;
int buzzer = 9;

void setup() {
  Serial.begin(9600);
  pinMode(buzzer, OUTPUT);
}

void loop() {

  int waterLevel = analogRead(sensor);
  Serial.println(waterLevel);

  if (waterLevel > 300) {
    tone(buzzer, 1000);
  } 
  else {
    noTone(buzzer);
  }

  delay(500);
}