dofile('functions.lua')
dofile('settings.lua')
dofile('wificount.lua')
dofile('postcount.lua')
wifi.setmode(wifi.STATION)
wifi.sta.config(ssid,pass)
if wifi.sta.getip() == nil then
	if wifi_count >= 5 then
		while gpio.read(reset_button) == 0 do
			print("wifi bisket, retry count=" .. wifi_count) -- del after testing
		end
		upd = "wifi_count = 0"
	else
		wifi_count = wifi_count + 1
		upd = "wifi_count = " .. wifi_count
		print("wifi not-connected, retry count=" .. wifi_count) -- del after testing
	end
	wifi_save(upd)
    tmr.alarm(0,500,tmr.ALARM_SINGLE,function()
      node.restart()
    end)
else
	print("wifi connected, retry count=" .. wifi_count) -- del after testing
	upd = "wifi_count = 0"
	wifi_save(upd)
    dofile("scan.lua")-- change this
end