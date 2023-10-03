#include <ezButton.h>

ezButton mySwitch(17);  // create ezButton object that attach to ESP32 pin GPIO17

void setup() {
  Serial.begin(9600);
  mySwitch.setDebounceTime(50); // set debounce time to 50 milliseconds
}

void loop() {
  mySwitch.loop(); // MUST call the loop() function first

  if (mySwitch.isPressed())
    Serial.println("The switch: OFF -> ON");

  if (mySwitch.isReleased())
    Serial.println("The switch: ON -> OFF");

  int state = mySwitch.getState();
  if (state == HIGH)
    Serial.println("The switch: OFF");
  else
    Serial.println("The switch: ON");
}