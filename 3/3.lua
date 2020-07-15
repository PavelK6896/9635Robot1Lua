dofile("../common/common.lua")

function main()
    log(os.date())
    log(os.date("%X"))

    t1 = createTable("t1")
    EuU0 = downloadTools(1)

    while on do
        setTable(1,1, os.date("%X"))
        setTable(1,2, EuU0:C(EuU0:Size()))
        setTable(1,4, EuU0:Size())

        sleep(1000)
    end

    log("stop")
end