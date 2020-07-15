
function OnInit(script_path)
    local f = io.open("./log.txt", "w")
    f:close()
    log("OnInit "..os.date())
end
