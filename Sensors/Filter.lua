local sensorInfo = {
    name = "Filter",
    desc = "Filter a list by predicate",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list, predicate)
    local result = { }
    for _, x in ipairs(list) do
        if predicate(x) then
            result[#result+1] = x
        end
    end
    return result
end
