
#define VRX_PIN  36 // ESP32 pin GPIO36 (ADC0) connected to VRX pin
#define VRY_PIN  39 // ESP32 pin GPIO39 (ADC0) connected to VRY pin

void setup() {
  Serial.begin(9600) ;
}

void loop() {
  // read X and Y analog values
  int valueX = 0; // to store the X-axis value
  int valueY = 0; // to store the Y-axis value
  valueX = analogRead(VRX_PIN);
  valueY = analogRead(VRY_PIN);

  // print data to Serial Monitor on Arduino IDE
  Serial.print("x = ");
  Serial.print(valueX);
  Serial.print(", y = ");
  Serial.println(valueY);
  delay(200);
}