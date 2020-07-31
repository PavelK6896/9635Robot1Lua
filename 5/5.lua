dofile("../common/common.lua")

function main()
    log(os.date())
    log(os.date("%X"))

    t1 = createTable("t1")
    EuU0 = downloadTools(1)
    EDUO = downloadTools(2)
    SiU0 = downloadTools(3)

    EuU0.size = EuU0:Size()
    EDUO.size = EDUO:Size()
    SiU0.size = SiU0:Size()

    --индекс по инструментам
    index22 = {}
    minSize = math.min(EuU0.size, EDUO.size, SiU0.size)
    for i = minSize, 1, -1 do
        index22[1 + minSize - i] = (EuU0:C(EuU0.size - i) + EDUO:C(EDUO.size - i) + SiU0:C(SiU0.size - i)) / 3
    end


    smas2 = {}
    sma(20, smas2, index22)
    message("sma2 size = " .. #smas2)

    smas1 = {}
    sma(10, smas1, index22)
    message("sma1 size " .. #smas1)

    testS2(smas1, smas2, EuU0)--тест

    while on do
        setTable(1, 5, os.date("%X"))

        if (SiU0.size < SiU0:Size()) then--новая свеча

            index22[#index22 + 1] = (EuU0:C(EuU0:Size() - 1) + EDUO:C(EDUO:Size() - 1) + SiU0:C(SiU0:Size() - 1)) / 3

            smaUpdate(20, smas2, index22)
            message(tostring(smas2[#smas2]) .. " sma2")

            smaUpdate(10, smas1, index22)
            message(tostring(smas1[#smas1]) .. " sma1")

            SiU0.size = SiU0:Size()
        end

        --- if (smaTest2[#smaTest2 - const1 + i] > smaTest1[#smaTest1 - const1 + i])  // стало истина опен
        --- стало ложно слосе

        sleep(1000)
    end

    log("stop")
end


