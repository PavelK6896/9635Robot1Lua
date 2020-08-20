function log(msg)
    local f = io.open("./log.txt", "a")
    if (f ~= nil) then
        local str = string.format("[%s] %s\n", os.date(), tostring(msg))
        f:write(str)
        f:flush()
        f:close()
    end
end