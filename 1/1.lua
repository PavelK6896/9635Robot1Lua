function main()

    dofile("../common/downloadTools.lua")
    dofile("../common/log.lua")
    dofile("../common/OnStop.lua")
    dofile("../common/timeMarket.lua")
    dofile("../common/transId.lua")

    log(os.date())
    log(os.date("%X"))

    transIdWrite(100)

end