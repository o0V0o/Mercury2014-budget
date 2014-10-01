parts = {}

Camera = 10
CPU = 55
IR = 45
 Electronics = Camera + CPU + IR


DoubleGearmotor = 45
Aiming = 5
Swinging = 25
Arm = 10
 Motors = DoubleGearmotor + Aiming + Swinging

Supercaps = 45
 Power = Supercaps

nBearings = 5
Bearings = (nBearings/2) * 2
nAxels = 6
Axels = nAxels * 2
nCollars = 10
Collars = nCollars * 1
Wheels = 6
nHubs = 2
Hubs = nHubs * 7
Mechanical = Bearings + Axels + Collars + Wheels + Hubs


total = Power + Electronics + Motors + Mechanical
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
