local sensorInfo = {
    name = "AreUnitsClose",
    desc = "Check if the units close to each other",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains

function getInfo() return { period = -1 } end

return function(units, margin)
    local distances = map(units, function(x) return Sensors.nota_kcky_exam.ProjectMiddle(Vec3(Spring.GetUnitPosition(x))) end)
    return (max(distances) - max(distances, function(x, y) return x < y end)) < margin
end
