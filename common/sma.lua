
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