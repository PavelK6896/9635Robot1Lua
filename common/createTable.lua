
function createTable(name)
    MainTable = AllocTable()

    AddColumn(MainTable, 1, "1", true, QTABLE_STRING_TYPE, 10)
    AddColumn(MainTable, 2, "2", true, QTABLE_STRING_TYPE, 10)
    AddColumn(MainTable, 3, "3", true, QTABLE_STRING_TYPE, 10)
    AddColumn(MainTable, 4, "4", true, QTABLE_STRING_TYPE, 10)
    AddColumn(MainTable, 5, "5", true, QTABLE_STRING_TYPE, 10)

    CreateWindow(MainTable)
    SetWindowCaption(MainTable, name)

    for i = 1, 18 do InsertRow(MainTable, -1) end

    --- 1 ---
    SetCell(MainTable, 1, 1, "1/1")
    SetCell(MainTable, 1, 2, "1/2")
    SetCell(MainTable, 1, 3, "1/3")
    SetCell(MainTable, 1, 4, "1/4")
    SetCell(MainTable, 1, 5, "1/5")
    --- 2 ---
    SetCell(MainTable, 2, 1, "2/2")
    SetCell(MainTable, 2, 2, "2/2")
    SetCell(MainTable, 2, 3, "2/3")
    SetCell(MainTable, 2, 4, "2/4")
    SetCell(MainTable, 2, 5, "2/5")
    --- 3 ---
    SetCell(MainTable, 3, 1, "3/1")
    SetCell(MainTable, 3, 2, "3/2")
    SetCell(MainTable, 3, 3, "3/3")
    SetCell(MainTable, 3, 4, "3/4")
    SetCell(MainTable, 3, 5, "3/5")
    --- 4 ---
    SetCell(MainTable, 4, 1, "4/1")
    SetCell(MainTable, 4, 2, "4/2")
    SetCell(MainTable, 4, 3, "4/3")
    SetCell(MainTable, 4, 4, "4/4")
    SetCell(MainTable, 4, 5, "4/5")
    --- 5 ---
    SetCell(MainTable, 5, 1, "5/1")
    SetCell(MainTable, 5, 2, "5/2")
    SetCell(MainTable, 5, 3, "5/3")
    SetCell(MainTable, 5, 4, "5/4")
    SetCell(MainTable, 5, 5, "5/5")
    --- 6 ---
    SetCell(MainTable, 6, 1, "6/1")
    SetCell(MainTable, 6, 2, "6/2")
    SetCell(MainTable, 6, 3, "6/3")
    SetCell(MainTable, 6, 4, "6/4")
    SetCell(MainTable, 6, 5, "6/5")
    --- 7 ---
    SetCell(MainTable, 7, 1, "7/1")
    SetCell(MainTable, 7, 2, "7/2")
    SetCell(MainTable, 7, 3, "7/3")
    SetCell(MainTable, 7, 4, "7/4")
    SetCell(MainTable, 7, 5, "7/5")
    --- 10 ---
    SetCell(MainTable, 10, 1, "10/1")
    SetCell(MainTable, 10, 2, "10/2")
    SetCell(MainTable, 10, 3, "10/3")
    SetCell(MainTable, 10, 4, "10/4")
    SetCell(MainTable, 10, 5, "10/5")
    --- 11 ---
    SetCell(MainTable, 11, 1, "11/1")
    SetCell(MainTable, 11, 2, "11/2")
    SetCell(MainTable, 11, 3, "11/3")
    SetCell(MainTable, 11, 4, "11/4")
    SetCell(MainTable, 11, 5, "11/5")
    --- 12 ---
    SetCell(MainTable, 12, 1, "12/1")
    SetCell(MainTable, 12, 2, "12/2")
    SetCell(MainTable, 12, 3, "12/3")
    SetCell(MainTable, 12, 4, "12/4")
    SetCell(MainTable, 12, 5, "12/5")

    SetWindowPos(MainTable, 450, 0, 400, 400)
    SetTableNotificationCallback(MainTable, mainHendler)

    return MainTable
end

function setTable(i1, i2, text)
    SetCell(MainTable, i1, i2, tostring(text))
end
