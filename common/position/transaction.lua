function transaction(deal)

    ACCOUNT = "SPBFUT0011n"
    TYPE = "M"

    if (deal == "S") then
        OPERATION = "S"
    else
        OPERATION = "B"
    end


    PRICE = "0"
    QUANTITY = "1"

    if (TYPE == "M") then PRICE = "0" end

    if (trans_id == nil) then
        transIdRead()
    end
    trans_id = trans_id + 1

    transaction1 = {
        ["ACCOUNT"] = ACCOUNT,
        ["CLIENT_CODE"] = tostring(trans_id),
        ["TYPE"] = TYPE,
        ["TRANS_ID"] = tostring(trans_id),
        ["CLASSCODE"] = CLASSCODE,
        ["SECCODE"] = SECCODE[1],
        ["ACTION"] = "NEW_ORDER",
        ["OPERATION"] = OPERATION,
        ["PRICE"] = tostring(PRICE),
        ["QUANTITY"] = tostring(QUANTITY)
    }

    for key, val in pairs(transaction1) do
        log(tostring(key) .. " / " .. tostring(val))
    end


    result = sendTransaction(transaction1)
    message(result)
    transIdWrite(trans_id)
end

