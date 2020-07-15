on = true
function OnStop(flag)
   log("OnStop "..os.date("%X"))
    on = false
    DestroyTable(MainTable)
    return 30 -- задается таймаут в 3 секунды
end
