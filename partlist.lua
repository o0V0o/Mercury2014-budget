parts = {}

-- Electronics -----------------------------
Camera = 7 --chepo USB-webcam (see amazon.com)
CPU = 55 -- BBB
IR1 = 12 --http://pololu.com/products/2474 10-150cm 5v
IR2 = 10 --http://pololu.com/products/136 10-80cm
IR3 = 10 --http://pololu.com/products/2464 4-30cm
 Electronics = Camera + CPU + 3*IR3


-- Motion ---------------------------------
Microgearmotor = 8 -- http://www.tinyosshop.com/index.php?route=product/product&product_id=133
Microservo = 4 -- http://www.robotshop.com/en/dfrobot-micro-servo-motor.html
MicroContinousServo = 5 -- http://www.robotshop.com/en/9g-continuous-rotation-micro-servo.html
Tamiya3Spd = 7 -- http://www.robotshop.com/en/tamiya-3-speed-crank-axle-gear-box.html (16:1, 58:1, 203:1
Tamiya4Spd = 8 -- http://www.robotshop.com/en/tamiya-4-speed-crank-axle-gear-box-clear.html
BLDC1 = 15 -- http://www.robotshop.com/en/uav-brushless-motor-a2212-10-1400kv.html
BLDC2 = 19 -- http://www.robotshop.com/en/uav-brushless-motor-a2217-9-950kv.html
BLDC_Flat = 15 -- http://www.robotshop.com/en/uav-brushless-motor-a2204-14-1400kv.html

Drive = (Tamiya3Spd + BLDC1) * 2
Aiming = MicroContinousServo
Swinging = BLDC_Flat + Tamiya3Spd
Arm = Microservo * 2
 Motors = Drive + Aiming + Swinging

-- Power -----------------------
Farad400 = 13 -- http://www.digikey.com/product-detail/en/XB3560-2R5407-R/283-4176-ND/3721393
Farad350 = 12 -- http://www.digikey.com/product-detail/en/BCAP0350%20E270%20T11/1182-1016-ND/3079280

Supercaps = Farad350 * 3
 Power = Supercaps

-- Hardware ---------------------
Bearing = 1 -- http://www.servocity.com/html/flanged_ball_bearings.html
Axel = {}
Axel["1/4D"] = 1 -- http://www.servocity.com/html/1_4__precision_d-shafting.html
Axel["4mm"] = 1 -- http://www.servocity.com/html/4mm_precision_shafting.html
Collar = 1.50 -- http://www.servocity.com/html/steel_set_screw_collars.html
Wheel2in = 6 -- http://www.robotmarketplace.com/products/lite_flite_wheels.html
Wheel1in = 5 -- http://www.robotmarketplace.com/products/0-DUB100MW.html
Hub = 5 -- http://www.servocity.com/html/0_770__set_screw_hubs.html

Hardware = Bearing*4 + Axel["1/4D"]*2 + Collar*4 + Wheel1in + Wheel2in + Hub*3



total = Power + Electronics + Motors + Hardware
print("Elecritcal", "Motion", "Power", "Hardware")
print(Electronics, Motors, Power, Hardware)
print(tostring(total) .. "/300" , "remaining: " .. tostring(300-total))




--[[
--

Drive BLDC:
SuperTigre -> 30A $30 4mm shaft
http://www.robotmarketplace.com/products/0-SUPG8050.html 

Suppo UAV Brushlett Motor A2204/14  6amp (flat) $15 3.17mm shaft
http://www.robotshop.com/en/uav-brushless-motor-a2204-14-1400kv.html

Suppo UAV Brushlett Motor A2204/14  12amp $15 3.17mm shaft
http://www.robotshop.com/en/uav-brushless-motor-a2212-10-1400kv.html




Camera - ~$10
X Mirror Ball - ~ $10
R Wifi - $10
CPU - $55 (BBB)

#Sensors
IR - $45 ($15 * 3)
#####subtotal  $45

105

#Motors
(drive motor) BLDC Motor - $30-50
	Single Motor -> $30 (superTigre BLDC)
	Double Motor -> 
	Double Geared Motor -> $14 (gearboxes) $30 (BLDC) -> $45
(transmission) Linear Servo - $10

(swinging) BLDC Motor - $15
(aiming) Micro Gear Motor - $5
(arm/pickup) Micro Gear Motor - $10 ($5 x 2)
(arm/pickup) Micro Servo (continuous) - $10 ($5 x 2)


#####subtotal ~$75

#Parts
Bearings - $5 ($1 x 4) ($2/pair)
Wheels - $15
Gears - $15
Axels - $10
#####subtotal ~$60
120

#Power
Supercapacitors - $45 (15*4)
#####subtotal $45

$285


--]]
