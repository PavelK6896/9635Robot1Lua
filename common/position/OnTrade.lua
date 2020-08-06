local tr1 = 0;
function OnTrade(trade)
    log("OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade")
    if (tr1 ~= trade.trans_id) then
        log("OnTrade " .. trade.price)
        log("OnTrade " .. trade.qty)
        log("OnTrade " .. trade.trans_id)
        --    log("OnTrade " .. trade.value)

        --        for key, val in pairs(trade) do
        --            log(tostring(key) .. " / " .. tostring(val))
        --        end
        tr1 = trade.trans_id
    end
    log(" ----- OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade OnTrade")
end