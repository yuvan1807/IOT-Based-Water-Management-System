import processing.serial.*;

Serial myPort;
int waterLevel = 0;
String status = "";

void setup() {
  size(400,400);
  println(Serial.list()); 
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(200);

  fill(0);
  textSize(20);
  text("Smart Water Monitoring", 60,50);

  // Status Logic
  if (waterLevel < 100) {
    status = "LOW";
  } 
  else if (waterLevel < 300) {
    status = "MEDIUM";
  } 
  else {
    status = "FULL";
  }

  textSize(18);
  text("Water Level: " + status, 100,120);
  text("Value: " + waterLevel, 120,160);

  // Tank Bar
  fill(0,0,255);
  rect(150,300-waterLevel/3,100,waterLevel/3);

  // Alert text
  if (status.equals("FULL")) {
    fill(255,0,0);
    text("ALERT: TANK FULL!", 90,350);
  }
}

void serialEvent(Serial myPort) {
  String data = myPort.readStringUntil('\n');

  if (data != null) {
    data = trim(data);
    waterLevel = int(data);
  }
}
