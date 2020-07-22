tools = {}
toolsError = {}

INTERVAL = INTERVAL_M1

CLASSCODEf = "SPBFUT"
CLASSCODEa = "QJSIM"

SECCODEdemo = { "SBER", "LKOH", "GAZP", "ROSN", "GMKN", "hhh" }

SECCODEf = {
    "EuU0", "EDU0", "SiU0", "SRH0", "GDH0", "BRJ0", "GZH0",
    "SiM0", "SNH0", "PDH0", "MMH0", "LKH0", "SVH0", "GMH0", "SPH0", "VBH0"
}

SECCODEa = {
    "MOEX", "SBER", "GAZP", "NVTK", "SNGS", "GMKN", "SBERP", "LKOH", "TGKB",
    "ROSN", "IRAO", "VTBR", "YNDX", "MGNT", "AFLT", "HYDR", "TGKA", "ALRS",
    "TATN", "PLZL", "SNGSP", "FEES", "OGKB", "AFKS", "CHMF", "SIBN", "NLMK",
    "MTSS", "TGKBP", "PHOR", "RSTI"
}

SECCODE = SECCODEf
CLASSCODE = CLASSCODEf

function downloadTools(n)
    log("downloadTools "..n)
    local function f1(n)
        if isConnected() ~= 1 then
            log("нет подключения")
            return true
        end
        if (tools[n] == nil) then
            log("нет инструмента "..SECCODE[n])
            tools[n], toolsError[n] = CreateDataSource(CLASSCODE, SECCODE[n], INTERVAL)
            if (tools[n] ~= nil) then
                tools[n]:SetEmptyCallback()
                return true
            end
            return true
        end
        if ((tools[n]:C(tools[n]:Size())) == 0 or (tools[n]:C(tools[n]:Size())) == nil) then
            log("нет значений " .. SECCODE[n])
            if (timeMarket()) then
                tools[n], toolsError[n] = CreateDataSource(CLASSCODE, SECCODE[n], INTERVAL)
                if (tools[n] ~= nil) then
                    tools[n]:SetEmptyCallback()
                    return true
                end
                return true
            end
            return true
        end
        return false
    end

    while f1(n) do
        sleep(200)
    end



    log("инструмент загружен " .. SECCODE[n])
    return tools[n]
end

