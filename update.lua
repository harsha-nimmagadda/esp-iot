link = 'http://iot-test.tk?id=' .. k .. '&status=' .. v .. "&update"
http.get(link, nil, function(code, data)
	if (code < 0) then
		print("HTTP request failed")
		if post_count >= 3 then
            print("max requests reached")
            upd = "post_count = 0"
			file = 'request.lua'
		else
            post_count = post_count + 1
            upd = "post_count = " .. post_count
        end
		file = 'update.lua' 
	else
		upd = "post_count = 0"
		file = 'request.lua'
    end
	post_save(upd)
	run_script(800,file)
end)