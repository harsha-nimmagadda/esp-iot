function wifi_save(line)
	if file.open("wificount.lua", "w+") then
		file.write(line)
		file.close()
	end
end
function post_save(line)
    if file.open("postcount.lua", "w+") then
        file.write(line)
        file.close()
    end
end
function run_script(delay,file) -- runs the specified lua file after certian delay (should not run concurently,should be invoked while timer 0 is active)
	tmr.alarm(0,delay,tmr.ALARM_SINGLE,function()
		dofile(file)
	end)
end