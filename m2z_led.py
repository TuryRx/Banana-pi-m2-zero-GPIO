import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)

GPIO.setup(29, GPIO.OUT)
GPIO.output(29, GPIO.HIGH)

time.sleep(3)

GPIO.output(29, GPIO.LOW)
GPIO.cleanup()
