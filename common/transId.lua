

transIdWrite = function(transId)
    local f = io.open("./TransId", "w")
    if (f ~= nil) then
        f:seek("set", 0)
        f:write(tostring(transId or trans_id))
        f:close()
    end
end

transIdRead = function()
    local f = io.open("./TransId", "r+")
    if (f ~= nil) then
        f:seek("set", 0)
        trans_id = tonumber(f:read("*l"))
        log(tostring(trans_id .. " -TransId read"))
        f:close()
    else
        trans_id = 105
    end
end
