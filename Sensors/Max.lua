local sensorInfo = {
	name = "Max",
	desc = "Get a max of a list",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list, comparison)
    comparison = comparison or function(x, y) return x > y end
    local max = nil
    for _, x in ipairs(list) do
        if max == nil or comparison(x, max) then
            max = x
        end
    end
    return max
end
