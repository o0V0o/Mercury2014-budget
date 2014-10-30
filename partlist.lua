o = require("object")

parts = {}

Part = o.class()
function Part:__init(name, price, partNo, link, description, amount)
	description = description or "" -- give description a default value
	partNo = partNo or "?"
	link = link or "?" 
	amount = amount or 0 -- default to zero if no amount is specified

	self.name = name
	self.price = price
	self.partNo = partNo
	self.link = link
	self.amount = amount
	self.subtotal = amount * price
	self.description = description
	local idx
	while  parts[name .. tostring(idx)] do
		idx = idx or 1
		idx = idx + 1
	end
	parts[name..tostring(idx)] = self
end
function Part:__tostring()
	local t = {}
	table.insert(t, "Part: ")
	table.insert(t, self.name)
	table.insert(t, " - ")
	table.insert(t, self.description)
	table.insert(t, "\n\t$")
	table.insert(t, self.subtotal)
	table.insert(t, " (")
	table.insert(t, self.amount)
	table.insert(t, "x")
	table.insert(t, self.price)
	table.insert(t, ") - ")
	table.insert(t, self.partNo)
	table.insert(t, " - ")
	table.insert(t, self.link)
	return table.concat(t)
end
function Part.tableHeader()
	return "Name|Subtotal|Unit Price|Part No.|Link|Description\n" .. "---|---|---|---|---|---"
end
function Part:tableRow()
	local t = {}
	table.insert(t,self.name)
	table.insert(t," | ")
	table.insert(t,self.subtotal)
	table.insert(t," | ")
	table.insert(t, " (")
	table.insert(t, self.amount)
	table.insert(t, "x")
	table.insert(t, self.price)
	table.insert(t, ")")
	table.insert(t," | ")
	table.insert(t,self.partNo)
	table.insert(t," | ")
	table.insert(t,self.link)
	table.insert(t," | ")
	table.insert(t,self.description)
	return table.concat(t)
end


-- Electronics -----------------------------
Part("Camera", 10, nil, nil, "Cheapo USB webcam from amazon", 1) -- we don't yet have a camera picked out, so use default values for partNo + Link
Part("Edison Board", 75, nil, nil, "The main controller board for our robot", 1)
Part("IR Sensor", 12, nil, "http://pololu.com/products/2474", "Sharp IR distance sensor: 10-150cm 5v")
Part("IR Sensor", 10, nil, "http://pololu.com/products/136", "Sharp IR distance sensor: 10-80")
Part("IR Sensor", 10, nil, "http://pololu.com/products/2464", "Sharp IR distance sensor: 4-30", 0)
Part("IR Sensor", 7, nil, "http://www.digikey.com/product-detail/en/GP2Y0A51SK0F/425-2854-ND/4103863", "Sharp IR distance sensor: 2-150", 3)
Part("Transistor", .2, nil, "digikey", "Small npn transistors", 0)
Part("Transistor", .6, nil, "http://www.digikey.com/product-detail/en/ST13007/1026-ST13007-CHP/2521338", "Large NPN transistor, 8A, 80W, can support 8A@10V, Through Hole.", 12)
Part("Transistor", .5, nil, "http://www.digikey.com/product-detail/en/MJD44H11T4/497-2504-1-ND/603886", "Large NPN transistor, 8A max current, with 20W of power disipation", 0)
Part("Phototransistor", 0, nil, nil, "A phototransistor", 0)
Part("Resistor", 0, nil, "digikey", "small through-hole transistors", 0)
Part("Resistor", 0, nil, nil, "Large high-current resistor", 0)
Part("ADC", 7, nil, "http://www.digikey.com/product-detail/en/ADS7960SDBT/296-23512-5-ND/1880870", "8bit 12 input ADC with SPI interface and 1.8v capable digital logic levels", 0)
Part("ADC", 7, nil, "http://www.digikey.com/product-detail/en/ADS7961SDBT/296-23513-5-ND/1880871", "8bit 16 input ADC with SPI interface and 1.8v capable digital logic levels", 0)
Part("ADC", 6, "296-38044-1-ND", "http://www.digikey.com/product-detail/en/ADS7950SBRGER/296-38044-1-ND/4967249", "12bit 4 input ADC with SPI interface and 1.8v capable digital logic levels. (SMT)", 0)
Part("ADC", 7, "296-25847-1-ND", "http://www.digikey.com/product-detail/en/ADS7955SRGET/296-25847-1-ND/2237253", "12bit 4 input ADC with SPI interface and 1.8v capable digital logic levels. (SMT)", 0)
Part("ADC", 7, "296-25847-1-ND", "http://www.digikey.com/product-detail/en/ADS7951SRGER/296-38045-1-ND/4967250", "12bit 8 input ADC with SPI interface and 1.8v capable digital logic levels. (SMT)", 2)
Part("Rotary Sensor", 2.75, "3382H-1-502-ND", "http://www.digikey.com/product-detail/en/3382H-1-502/3382H-1-502-ND/2080232", "Resistive rotary position sensor. Senses from 0-330 degrees, with analog output voltage. (5KOhms)")
Part("Rotary Sensor", 2.75, "3382H-1-103-ND", "http://www.digikey.com/product-detail/en/3382H-1-103/3382H-1-103-ND/2080233", "Resistive rotary position sensor. Senses from 0-330 degrees, with analog output voltage. (10KOhms)",4)
Part("Reflectance Sensor", 3, nil, "https://www.sparkfun.com/products/9453", 1)
Part("Toggle Switch", 2, nil, "http://www.digikey.com/product-detail/en/PA412C1100/EG4688-ND/2116167", "Push button toggle switch, with black cap. 16A 125V rating.",0)
Part("Toggle Switch", 1.7, nil, "http://www.digikey.com/product-detail/en/PA412C1000-116/EG4689-ND/2116168", "Push button toggle switch, with red cap. 16A 125V rating.",1)
Part("Toggle Switch", 2, nil, "http://www.digikey.com/product-detail/en/PA4R12C1000-136/EG4694-ND/2116173", "Push button toggle switch, with green cap. 16A 125V rating.",1)
Part("Toggle Switch", .7, nil, "http://www.digikey.com/product-detail/en/GPTS203212B/CW182-ND/3190592", "Push button toggle switch, with small round black cap. 1A 14V rating")
Part("RGB LED",.55, nil, "http://www.digikey.com/product-detail/en/CLVBA-FKA-CAEDH8BBB7A363/CLVBA-FKA-CAEDH8BBB7A363CT-ND/2650500", "RGB SMT LED with black casing", 5)
Part("RGB LED",.55, nil, "http://www.digikey.com/product-detail/en/LTST-C19HE1WT/160-2162-1-ND/4866310", "RGB SMT LED")

-- Motion ---------------------------------
Part("Micro Gear Motor", 9, nil, "http://www.tinyosshop.com/index.php?route=product/product&product_id=133", "A small gearmotor with high torque")
Part("Micro Servo", 4, nil, "http://www.robotshop.com/en/dfrobot-micro-servo-motor.html", "A small servo motor", 4)
Part("Micro Continous Servo" , 5, nil ," http://www.robotshop.com/en/9g-continuous-rotation-micro-servo.html", "A small continous rotation servo motor", 3)
Part("Tamiya Gearbox" , 7, nil ,"http://www.robotshop.com/en/tamiya-3-speed-crank-axle-gear-box.html", "A plastic gearbox with several ratios (16:1, 58:1, 203:1)")
Part("Tamiya Gearbox" , 8, nil , "http://www.robotshop.com/en/tamiya-4-speed-crank-axle-gear-box-clear.html", "A plastic gearbox with several ratios")
Part("Brushless DC Motor" , 15, nil, "http://www.robotshop.com/en/uav-brushless-motor-a2212-10-1400kv.html", "A larger brushless DC mtoor, with up to 180W of power @ 12Amps")
Part("Brushless DC Motor",19 ,nil, " http://www.robotshop.com/en/uav-brushless-motor-a2217-9-950kv.html", "A larger brushless DC motor, with up to 18Amps of current")
Part("Brushless DC Motor", 15, nil, "http://www.robotshop.com/en/uav-brushless-motor-a2204-14-1400kv.html", "A smaller brushless DC motor, with up to 75W of power @ 6Amps", 2)

-- Power -----------------------
Part("Super Capacitor",  13, nil, "http://www.digikey.com/product-detail/en/XB3560-2R5407-R/283-4176-ND/3721393", "A 400 Farad supercapacitor @ 2.5v")
Part("Super Capacitor",  12, nil, "http://www.digikey.com/product-detail/en/BCAP0350%20E270%20T11/1182-1016-ND/3079280", "A 350 Farat supercapacitor @ 2.7v")
Part("Battery", 25, nil, nil, "A LiFe chemistry battery, with 12A discharge rate and 1.2Amp Hours",1)


-- Hardware ---------------------
Part("1/8\" Diameter Axel (1\" length)", 1, nil, nil, "Round 1/8\" Diameter Axel", 4)
Part("1/4\" Diameter D Shaft (2\" length)", 1, nil, nil, "D shaped shafting", 1)
Part("Bearing", 1, nil, "http://www.servocity.com/html/flanged_ball_bearings.html", "Flanged ball bearing", 5)
Part("Shaft Collar", 0.50, nil, "http://www.servocity.com/html/steel_set_screw_collars.html", "Set screw shaft collar", 10)
Part("Wheel", 6, nil, "http://www.robotmarketplace.com/products/lite_flite_wheels.html", "2\" diameter Lite Flite foam wheels",0)
Part("Wheel", 6, nil, "http://www.robotmarketplace.com/products/lite_flite_wheels.html", "1.75\" diameter Lectra Flite foam wheels",0)
Part("Wheel", 11, nil, "http://www.pololu.com/product/1687", "2.56\" diameter spiked rubber wheels",0)
Part("Wheel", 4, nil, "http://www.servocity.com/html/precision_disk_wheels.html#.VEm1NH_LcQU", "2\" diameter thin plastic wheels with rubber rims", 1)
Part("Wheel", 5, nil, "http://www.servocity.com/html/precision_disk_wheels.html#.VEm1NH_LcQU", "3\" diameter thin plastic wheels with rubber rims", 1)
Part("Wheel Hub", 5, nil, "http://www.servocity.com/html/0_770__set_screw_hubs.html", "A wheel hub with screw holes and a set screw")

total = 0
print( Part.tableHeader() )
for name, part in pairs(parts) do
	if part.amount > 0 then
		print(part:tableRow())
	end
	total = total + part.subtotal
end
print ( "|", total, "||||")
print("")
print ( "Total: ", total, "remaining:", 300-total)

return parts
