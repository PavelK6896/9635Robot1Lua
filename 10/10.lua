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
    message("EuU0" .. tostring(EuU0.size) .. " EDUO" .. tostring(EDUO.size) .. "SiU0" .. tostring(SiU0.size))

    --индекс по инструментам
    index22 = {}
    minSize = math.min(EuU0.size, EDUO.size, SiU0.size)


    --запись в файл
    local f5 = io.open("../data1.txt", "w")
    for i = minSize - 1, 1, -1 do
        f5:write(i .. ',' .. EuU0:C(EuU0.size - i) .. ',' .. EDUO:C(EDUO.size - i) .. ',' .. SiU0:C(SiU0.size - i) .. '\n')
    end
    f5:close()

    log("stop")
end

