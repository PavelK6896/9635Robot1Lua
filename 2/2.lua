dofile("../common/common.lua")

function main()

    transIdWrite(100)

    while on do

        sleep(1000)
    end
end


function OnAllTrade(alltrade)
    log("OnAllTrade" .. alltrade.price)
end

function OnDepoLimit(dlimit)
    log("OnDepoLimit" .. dlimit.sec_code)
end

function OnFirm(firm)
    log("OnFirm " .. firm.firmid)
end

function OnFuturesClientHolding(fut_pos)
    log("OnFuturesClientHolding " .. fut_pos.varmargin .. " num " .. fut_pos.totalnet )
end

function OnNegTrade(neg_trade)
    log("OnNegTrade " .. neg_trade.trade_num)
end

function OnOrder(order)
    log("OnOrder " .. order.price )
end

--function OnParam(class, sec)
--    log("OnParam " .. sec)
--    if class == "SPBFUT" and sec == "RIZ2" then
--        tbid = getParamEx(class, sec, "bid")
--        if tbid.param_value >= 130000 then
--            message("Спрос " .. tbid.param_image)
--        end
--    end
--end

function OnTrade(trade)
    log("OnTrade " .. trade.price )
end

function OnTransReply(trans_reply)
    log("OnTransReply " .. trans_reply.trans_id)
end

