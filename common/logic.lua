function logikL1(sma1, sma2)
    -- long signal
    -- момент переключения
    if (sma2[#sma2] < sma1[#sma1] and sma2[#sma2 - 1] > sma1[#sma1 - 1]) then
        return true, "LONG! @ # this!!! "
    else
        if (sma2[#sma2] < sma1[#sma1]) then
            return false, "long ACTIV "
        end
        return false, "long not activ..."
    end
end

function logikS1(sma1, sma2)
    -- шорт signal
    -- момент переключения
    if (sma2[#sma2] > sma1[#sma1] and sma2[#sma2 - 1] < sma1[#sma1 - 1]) then
        return true, "SHORT! @ # this!!! "
    else
        if (sma2[#sma2] > sma1[#sma1]) then
            return false, "short ACTIV "
        end
        return false, "short not activ..."
    end
end