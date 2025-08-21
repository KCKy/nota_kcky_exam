local sensorInfo = {
    name = "ProjectMiddle",
    desc = "Project a position to the middle lane (approximate), returns 0 - 1",
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

local function projectLine(a, b, point)
    local pointRelative = point - a
    local direction = (b - a):GetNormalized()
    local length = (b - a):Length()
    return direction:DotProduct(pointRelative) / length
end

return function(position)
    local points = Sensors.core.MissionInfo().corridors.Middle.points
    return projectLine(points[1].position, points[#points].position, position)
end
