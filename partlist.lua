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
	--if parts.name then error("Already a part by that name") end
	parts[name] = self
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


-- Electronics -----------------------------
Part("Camera", 10, nil, nil, "Cheapo USB webcam from amazon", 1) -- we don't yet have a camera picked out, so use default values for partNo + Link
Part("Edison Board", 75, nil, nil, "The main controller board for our robot", 1)
Part("IR Sensor", 12, nil, "http://pololu.com/products/2474", "Sharp IR distance sensor: 10-150cm 5v")
Part("IR Sensor", 10, nil, "http://pololu.com/products/136", "Sharp IR distance sensor: 10-80")
Part("IR Sensor", 10, nil, "http://pololu.com/products/2464", "Sharp IR distance sensor: 4-30", 3)

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
Part("Wheel", 6, nil, "http://www.robotmarketplace.com/products/lite_flite_wheels.html", "2\" diameter Lite Flite foam wheels",1)
Part("Wheel", 6, nil, "http://www.robotmarketplace.com/products/lite_flite_wheels.html", "1.75\" diameter Lectra Flite foam wheels",1)
Part("Wheel", 11, nil, "http://www.pololu.com/product/1687", "2.56\" diameter spiked rubber wheels",1)
Part("Wheel", 11, nil, "http://www.pololu.com/product/1687", "2.56\" diameter spiked rubber wheels",1)
Part("Wheel Hub", 5, nil, "http://www.servocity.com/html/0_770__set_screw_hubs.html", "A wheel hub with screw holes and a set screw")

total = 0
for name, part in pairs(parts) do
	if part.amount > 0 then
		print(part)
	end
	total = total + part.subtotal
end
print ( "Total: ", total, "remaining:", 300-total)

return parts
