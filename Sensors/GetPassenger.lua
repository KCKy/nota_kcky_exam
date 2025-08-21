local sensorInfo = {
    name = "GetPassenger",
    desc = "Get closest passenger for an atlas",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

return function(unit, requests)
    local position = Vec3(Spring.GetUnitPosition(unit))
    local function compare(a, b)
        a = (Vec3(Spring.GetUnitPosition(a)) - position):Length()
        b = (Vec3(Spring.GetUnitPosition(b)) - position):Length()
        return a > b
    end

    table.sort(requests, compare)
    return requests[#requests]
end

