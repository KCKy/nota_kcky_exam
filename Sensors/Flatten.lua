local sensorInfo = {
    name = "Flatten",
    desc = "Flatten a list of lists",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list)
    local result = { }
    for _, x in ipairs(list) do
        for i=1,#x do
            result[#result+1] = x[i]
        end
    end
    return result
end
