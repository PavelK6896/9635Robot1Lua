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

    index1 = {}
    minSize = math.min(EuU0.size, EDUO.size, SiU0.size)
    for i = minSize, 1, -1 do
        index1[1 + minSize - i] = (EuU0:C(EuU0.size - i) + EDUO:C(EDUO.size - i) + SiU0:C(SiU0.size - i)) / 3
    end

    while on do
        setTable(1, 5, os.date("%X"))

        if (SiU0.size < SiU0:Size()) then
            index1[#index1 + 1] = (EuU0:C(EuU0:Size() - 1) + EDUO:C(EDUO:Size() - 1) + SiU0:C(SiU0:Size() - 1)) / 3
            setTable(5, 5, "i1 " .. index1[#index1])
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