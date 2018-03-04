ssid = "Act Network"
pass = "gupt@1234"
reset_button = 11
gpio.mode(reset_button, gpio.INPUT)
fan = 0 -- fan control
gpio.mode(fan, gpio.OUTPUT)
gpio.write(fan, gpio.LOW)
light = 2 -- light control
gpio.mode(light, gpio.OUTPUT)
gpio.write(light, gpio.LOW)