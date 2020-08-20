dofile("../common/common.lua")

function main()
    log(os.date())
    log(os.date("%X"))
    t1 = createTable("t1")

    file = io.open("./res.txt", "w")
    log("*/***")

    --параметры виде строки
    sec_list = getClassSecurities("SPBFUT")
    message(tostring(sec_list))
    file:close()

    while on do
        setTable(1, 1, os.date("%X"))

        sleep(800)
    end
    log("stop")
end


