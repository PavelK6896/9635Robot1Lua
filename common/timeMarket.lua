function timeMarket()
    local ServerTime = getInfoParam("SERVERTIME")
    if (ServerTime ~= nil) then
        if (CLASSCODE == "SPBFUT") then
            if (ServerTime > "10:00:00" and ServerTime < "23:50:00") then
                if (ServerTime > "14:00:00" and ServerTime < "14:05:00" or
                        ServerTime > "18:45:00" and ServerTime < "19:05:00") then
                    log("Kliring")
                    return false
                end
                log("SPBFUT working")
                return true
            end
            log("Mercet close")
            return false
        elseif (CLASSCODE == "TQBR") then
            if (ServerTime > "10:00:00" and ServerTime < "18:45:00") then
                if (ServerTime > "14:00:00" and ServerTime < "14:05:00") then
                    log("Kliring")
                    return false
                end
                log("TQBR working")
                return true
            end
            log("Mercet close")
            return false
        elseif (CLASSCODE == "QJSIM") then
            log("QJSIM working")
            return true
        end
        log("Not Code class")
        return false
    end
    log("Not ServerTime")
    return false
end
