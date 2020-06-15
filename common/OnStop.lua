on = true
function OnStop()
    log("Stop")
    on = false
    DestroyTable(MainTable)
end