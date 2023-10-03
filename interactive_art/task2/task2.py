from gpiozero import Button, LED

redLED = LED(15)
yellowLED = LED(18)
greenLED = LED(23)
blueLED = LED(24)

button = Button(21)
joystick = Button(25)

while True:
	joystick.wait_for_press()
	print("joystick press")
	joystick.wait_for_release()
	print("joystick release")


	button.wait_for_press()
	print("hello")	
	redLED.on()
	yellowLED.on()
	greenLED.on()
	blueLED.on()
	button.wait_for_release()
	print("goodbye")
	redLED.off()
	yellowLED.off()
	greenLED.off()
	blueLED.off()
