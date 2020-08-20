function testS1(smaTest1, smaTest2, toolTest)

    local f2 = io.open("./t.txt", "w")
    local f3 = io.open("./t3.txt", "w")
    local bool;
    local pnumber = 0;
    local sum1 = 0;
    local sum2 = 0;

    --    message(tostring(toolTest:Size()))

    for i = 0, #smaTest2 - 1 do
        if (smaTest2[#smaTest2 - i] < smaTest1[#smaTest1 - i]) then
            if (bool == "false") then
                f3:write(toolTest:Size() - i .. " /шорт+/ " .. toolTest:C(toolTest:Size() - i) .. ' -- ')
                pnumber = toolTest:C(toolTest:Size() - i)
            end
            bool = "true"

        else
            if (bool == "true") then
                if (pnumber ~= 0) then
                    sum1 = pnumber - toolTest:C(toolTest:Size() - i)
                    if (sum1 ~= 0) then
                        sum2 = sum2 + sum1
                    end
                end
                f3:write(toolTest:Size() - i .. " /шорт-/ " .. toolTest:C(toolTest:Size() - i) ..
                        ' -- ' .. (sum1) .. ' +++ ' .. sum2 .. ' == ' .. ' * \n')
            end
            bool = "false"
        end
        f2:write(#smaTest2 - i .. " // " .. math.floor(smaTest2[#smaTest2 - i]) .. " || " .. math.floor(smaTest1[#smaTest1 - i]) ..
                " [ " .. bool .. " * \n")
    end
    f2:close()
    f3:close()
end

function testS2(smaTest1, smaTest2, toolTest)

    local f2 = io.open("./test1.txt", "w")
    local f3 = io.open("./test2.txt", "w")
    local bool;
    local pnumber = 0;
    local sum1 = 0;
    local sum2 = 0;
    local const1 = 4000;
    local size1 = toolTest:Size() - const1

    f3:write(toolTest:Size() .. '\n')

    for i = 0, const1 do
        if (smaTest2[#smaTest2 - const1 + i] > smaTest1[#smaTest1 - const1 + i]) then
            if (bool == "false") then
                f3:write(size1 + i .. " /шорт+/ " .. toolTest:C(size1 + i) .. ' -- ')
                pnumber = toolTest:C(size1 + i)
            end
            bool = "true"

        else
            if (bool == "true") then
                if (pnumber ~= 0) then
                    sum1 = toolTest:C(size1 + i) - pnumber
                    if (sum1 ~= 0) then
                        sum2 = sum2 + sum1
                    end
                end
                f3:write(size1 + i .. " /шорт-/ " .. toolTest:C(size1 + i) ..
                        ' -- ' .. (sum1) .. ' +++ ' .. sum2 .. ' == ' .. ' * \n')
            end

            bool = "false"
        end
    end
    f2:close()
    f3:close()
end


function testL1(smaTest1, smaTest2, toolTest)

    local f2 = io.open("./test1.txt", "w")
    local f3 = io.open("./test2.txt", "w")
    local bool;
    local pnumber = 0;
    local sum1 = 0;
    local sum2 = 0;
    local const1 = 2000;
    local size1 = toolTest:Size() - const1

    f3:write(toolTest:Size() .. '\n')

    for i = 0, const1 do
        if (smaTest2[#smaTest2 - const1 + i] < smaTest1[#smaTest1 - const1 + i]) then
            if (bool == "false") then
                f3:write(size1 + i .. " /лонг+/ " .. toolTest:C(size1 + i) .. ' -- ')
                pnumber = toolTest:C(size1 + i)
            end
            bool = "true"

        else
            if (bool == "true") then
                if (pnumber ~= 0) then
                    sum1 = toolTest:C(size1 + i) - pnumber
                    if (sum1 ~= 0) then
                        sum2 = sum2 + sum1
                    end
                end
                f3:write(size1 + i .. " /лонг-/ " .. toolTest:C(size1 + i) ..
                        ' -- ' .. (sum1) .. ' +++ ' .. sum2 .. ' == ' .. ' * \n')
            end

            bool = "false"
        end
    end

    if (sum2 > 1800) then
        local f4 = io.open("./test3.txt", "a")
        f4:write('/p1/' .. smaTest1.periud .. '/p2/' .. smaTest2.periud .. '/sum2/' .. sum2 .. ' * \n')
        f4:close()
    end

    f2:close()
    f3:close()

    return sum2
end