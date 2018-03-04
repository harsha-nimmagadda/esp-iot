dofile("settings.lua")
wifi.setmode(wifi.STATION)
wifi.sta.config(ssid,pass)
if wifi.sta.getip() == nil then
    print("not connected") --add fail counter here
    --dofile("init.lua")
else
    print( wifi.sta.getip())
    print("connected")
    dofile("request.lua")
end
