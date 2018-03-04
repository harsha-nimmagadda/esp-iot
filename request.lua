http.get("http://iot-test.tk?status", nil, function(code, data)
    if (code < 0) then
		print("HTTP request failed")
		if post_count >= 5 then
            while gpio.read(reset_button) == 0 do
                print("max requests reached")
             end
             upd = "post_count = 0"
			 tmr.alarm(1,500,tmr.ALARM_SINGLE,function()
				node.restart()
			 end)
		else
            post_count = post_count + 1
            upd = "post_count = " .. post_count
			run_script(1000,'request.lua')
        end
    else
		upd = "post_count = 0"
		t = sjson.decode(data)
		for k,v in pairs(t) do
			print(k,v)--del
			if k=="fail" then
				run_script(5000,'request.lua')
			else
				if k=="1" then
					device = fan
				elseif k=="2" then
					device = light
				end
				if v=="0" then
					status = gpio.LOW
				elseif v=="1" then
					status = gpio.HIGH
				end
				gpio.write(device, status)
				run_script(500,'update.lua')
			end
		end
    end
	post_save(upd)
  end)