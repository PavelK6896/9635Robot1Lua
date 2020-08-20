dofile("../common/common.lua")

--get data из таблиц разных
function main()
    log(os.date())
    log(os.date("%X"))

    --    n = getNumberOf("orders")
    --    order={}
    --    message("total ".. tostring(n) .. " of all orders", 1)
    --    for i=0,n-1 do
    --        order = getItem("orders", i)
    --        message("order: num=" .. tostring(order["order_num"]) .. " qty=" .. tostring(order["qty"]) .. " value=" .. tostring(order["value"]), 1)
    --    end


    t1 = createTable("t1")


    ttt = {
        "firms",
        "classes",
        "securities",
        "trade_accounts",
        "client_codes",
        "all_trades",
        "account_positions",
        "orders",
        "futures_client_holding",
        "futures_client_limits",
        "money_limits",
        "depo_limits",
        "trades",
        "stop_orders",
        "neg_deals",
        "neg_trades",
        "neg_deal_reports",
        "firm_holding",
        "account_balance",
        "ccp_holdings",
        "rm_holdings",
    }

    file = io.open("./res.txt", "w")
    log("*/***")

    for key, v in ipairs(ttt) do
        file:write(v .. " = " .. key .. "\n")
        for i = 0, 5 do
            dd = getItem(v , i)

            if (dd == nil) then
                break
            end

            if (type(dd) == 'string') then
                break
            end

            if (type(dd) == 'number') then
                break
            end


            message("EuU0" .. tostring(type(dd)))

            index22 = 0
            for key2, val2 in pairs(dd) do
                index22 = index22 + 1
                file:write(v .. ' / ' .. key2 .. " = " .. val2 .. "\n")
                if (index22 > 5) then
                    break
                end
            end
            file:write("--------------------------\n")

        end
        file:write("************************************\n")
    end

    --    ss = getNumberOf('securities')
    --
    --    for i = 0, ss - 1 do
    --        dd = getItem("securities", i)
    --        file:write(i .. '/ ' .. dd['code'] .. '/ ' .. dd['class_code'] .. "\n")
    --    end

    --    message("EuU0" .. tostring(dd['code']))

    --    for key, val in pairs(dd) do
    --        file:write('/ ' .. key .. " = " .. val .. "\n")
    --    end

    --    for key,v in ipairs(dd) do
    --        log("*/***")
    --        log(key)
    --        log(v)
    --        file:write('/' .. v .. " = " .. (key) .. "\n")
    --    end

    file:close()


    while on do
        setTable(1, 1, os.date("%X"))

        sleep(800)
    end
    log("stop")
end


