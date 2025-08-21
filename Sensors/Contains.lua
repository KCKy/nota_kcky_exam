local sensorInfo = {
    name = "Contains",
    desc = "Check if given list contains a value",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list, value, comparison)
    comparison = comparison or function(x, y) return x == y end
    for _, x in ipairs(list) do
        if comparison(x, value) then
            return true
        end
    end
    return false
end
