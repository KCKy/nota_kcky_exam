local sensorInfo = {
    name = "GetMiddlePosition",
    desc = "Get position of the middle lane at given percentage (approximate)",
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

return function(progress)
    local points = Sensors.core.MissionInfo().corridors.Middle.points
    local a = points[1].position
    local b = points[#points].position
    b = b - a
    
    if progress < 0 then
        progress = 0
    elseif progress > 1 then
        progress = 1
    end

    b:Mul(progress)

    return a + b
end
