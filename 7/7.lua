dofile("../common/common.lua")

--долгий тест подбора параметров
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
    message("EuU0" .. tostring(EuU0.size) .. " EDUO" .. tostring(EDUO.size) .. "SiU0" .. tostring(SiU0.size))

    --индекс по инструментам
    index22 = {}
    minSize = math.min(EuU0.size, EDUO.size, SiU0.size)

    local f5 = io.open("./test5.txt", "w")
    for i = minSize - 1, 1, -1 do
        f5:write( i .. '/' .. EuU0:C(EuU0.size - i) .. '/' .. EDUO:C(EDUO.size - i) .. '/' .. SiU0:C(SiU0.size - i) .. '\n')
    end
    f5:close()

    for i = minSize, 1, -1 do
        index22[1 + minSize - i] = (EuU0:C(EuU0.size - i) + EDUO:C(EDUO.size - i) + SiU0:C(SiU0.size - i)) / 3
    end

    for i = 5, 150 do
        for j = 5, 150 do
            smas1 = {}
            sma(i, smas1, index22)
            smas1.periud = i
            smas2 = {}
            sma(j, smas2, index22)
            smas2.periud = j

            setTable(1, 1, testL1(smas1, smas2, EuU0))
        end
    end
    message("testT")

    testT = false --тест transaction

    while on do
        setTable(1, 5, os.date("%X"))

        if (SiU0.size < SiU0:Size()) then --новая свеча

            index22[#index22 + 1] = (EuU0:C(EuU0:Size() - 1) + EDUO:C(EDUO:Size() - 1) + SiU0:C(SiU0:Size() - 1)) / 3

            smaUpdate(20, smas2, index22)
            message(tostring(smas2[#smas2]) .. " sma2")

            smaUpdate(10, smas1, index22)
            message(tostring(smas1[#smas1]) .. " sma1")

            --            if (testT) then
            --                log("new -------------------------------------------------------- false")
            --                transaction("S")
            --                testT = false
            --            else
            --                log("new ********************************************************* true")
            --                transaction("L")
            --                testT = true
            --            end

            boolL1, textL1 = logikL1(smas1, smas2)
            log(textL1 .. tostring(boolL1))

            -- open long
            if (boolL1) then
                transaction("L")
                message("long open ")
            end

            boolS1, textS1 = logikS1(smas1, smas2)
            log(textS1 .. tostring(boolS1))

            if (boolS1) then
                transaction("S")
                message("long close ")
            end

            SiU0.size = SiU0:Size()
        end

        sleep(1000)
    end
    log("stop")
end


