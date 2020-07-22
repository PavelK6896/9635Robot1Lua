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

    --индекс
    index22 = {}
    minSize = math.min(EuU0.size, EDUO.size, SiU0.size)
    for i = minSize, 1, -1 do
        index22[1 + minSize - i] = (EuU0:C(EuU0.size - i) + EDUO:C(EDUO.size - i) + SiU0:C(SiU0.size - i)) / 3
    end
    smas2 = {}
    sma(20, smas2, index22)
    message("sma2 size = " .. #smas2)
    --просто клосе
    closes1 = {}
    for i = 1, 50 do
        closes1[i] = SiU0:C(SiU0:Size() - 51 + i)
    end
    smas1 = {}
    sma(10, smas1, closes1)
    message("sma1 size " .. #smas1)


    while on do
        setTable(1, 5, os.date("%X"))

        if (SiU0.size < SiU0:Size()) then
            index22[#index22 + 1] = (EuU0:C(EuU0:Size() - 1) + EDUO:C(EDUO:Size() - 1) + SiU0:C(SiU0:Size() - 1)) / 3
            smaUpdate(20, smas2, index22)
            message(tostring(smas2[#smas2]) .. " sma2")

            closes1[#closes1 + 1] = SiU0:C(SiU0:Size() - 1)
            smaUpdate(10, smas1, closes1)
            message(tostring(smas1[#smas1]) .. " sma1")
            SiU0.size = SiU0:Size()
        end

        setTable(1, 1, SECCODEf[1])
        setTable(1, 2, EuU0:C(EuU0:Size()))
        setTable(1, 3, EuU0:Size())

        setTable(2, 1, SECCODEf[2])
        setTable(2, 2, EDUO:C(EDUO:Size()))
        setTable(2, 3, EDUO:Size())

        setTable(3, 1, SECCODEf[3])
        setTable(3, 2, SiU0:C(SiU0:Size()))
        setTable(3, 3, SiU0:Size())

        sleep(1000)
    end
    log("stop")
end

function smaUpdate(periud, arr, index1)
    sum = 0
    for i = 0, periud - 1 do -- сщитаем значение
        sum = sum + index1[#index1 - i]
        -- message(tostring(i))
    end
    arr[#arr + 1] = sum / periud
    return arr
end

function sma(periud, arr, index1)
    for i, val in ipairs(index1) do -- перебераем индкс
        if i > periud + 1 then -- пропустить начало
            sum = 0
            for j = 1, periud do -- сщитаем значение
                sum = sum + index1[i - j + 1]
            end
            arr[#arr + 1] = sum / periud
            -- message(tostring(arr[#arr]))
        end
    end
    return arr
end
