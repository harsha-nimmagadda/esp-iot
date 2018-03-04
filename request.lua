conn=net.createConnection(net.TCP,false)
conn:on("receive", function(conn, pl) print(pl) end)
conn:connect(80,"192.168.1.1")
conn:send("GET /DEV_device.htm HTTP/1.1\r\n"
        .."Host: 192.168.1.1\r\n"
        .."Connection: keep-alive\r\n"
        .."Cache-Control: max-age=0\r\n"
        .."Authorization: Basic YWRtaW46cGFzc3dvcmQ=\r\n"
        .."Upgrade-Insecure-Requests: 1\r\n"
        .."User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36\r\n"
        .."Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8\r\n"
        .."Referer: http://192.168.1.1/\r\n"
        .."Accept-Encoding: gzip, deflate, sdch\r\n"
        .."Accept-Language: en-IN,en-US;q=0.8,en;q=0.6\r\n\r\n")
       










