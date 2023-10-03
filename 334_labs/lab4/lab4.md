# Lab4: ESP32
Malia Kuo and Lucy Sun

1. Installed arduino IDE onto laptop
2. Arduino IDE->settings->preferences->additional board manager urls
* Copy pasted: https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json
3. Tools → boards→ board manager
* Esp32 by essif
4. Tools → boards → esp32→ esp32 dev module
5. Tools → port → cu.serial
6. File → examples → esp32 → hall sensor
7. Connecting with PI:
* Ssh into via laptop 
* Dialout check
* Plugged esp32 into pi type A
* In terminal: ls /dev/tty*
* * Found which one was the esp32: /dev/ttyUSB0
8. Program w joystick: analog input:
* https://esp32io.com/tutorials/esp32-joystick 
* Connected joystick via wires to the esp32
* Connected esp32 to laptop
* Uploaded and compiled the code
* Checked out with serial monitor
* For the python code, used pyserial to read input from esp32 when it was connected to pi - code in joystick_esp32.py
* * Very helpful link for reading input from esp32: https://www.instructables.com/Python-Serial-Port-Communication-Between-PC-and-Ar/
9. Program with button: digital input
* https://esp32io.com/tutorials/esp32-button
* Connected button via wires to esp32
* Connected esp32 to laptop
* Uploaded and compiled the code
* Checked out press and release events with serial monitor
* When connected to pi, used the same script as last time - and it worked!
10. Program with switch: digital input
* https://esp32io.com/tutorials/esp32-switch
* Connected switch via wires to esp32
* Connected esp32 to laptop
* Uploaded and compiled the code
* Checked out press and release events with serial monitor
* When connected to pi, used the same script as last time - and it worked!
