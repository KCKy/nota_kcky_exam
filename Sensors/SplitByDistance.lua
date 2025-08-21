local sensorInfo = {
    name = "SplitByDistance",
    desc = "Splits units by distance",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

return function(units, goal, splitDistance)
    local close = {}
    local far = {}
    goal = Vec3(Spring.GetUnitPosition(goal))

    for _, unit in ipairs(units) do
        local distance = (Vec3(Spring.GetUnitPosition(unit)) - goal):Length()
        if distance < splitDistance then
            close[#close+1] = unit
        else
            far[#far+1] = unit
        end
    end

    return {close=close, far=far}
end
