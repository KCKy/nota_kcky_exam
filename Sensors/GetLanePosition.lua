local sensorInfo = {
    name = "GetLanePosition",
    desc = "",
    author = "KCKy",
    date = "2025-08-11",
    license = "MIT",
}

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains

function getInfo() return { period = -1 } end

local function segmentLength(a, b)
    return (b - a):Length()
end

local function totalLength(points) 
    local sum = 0
    for i=1,(#points-1) do
        sum = sum + segmentLength(points[i], points[i+1])
    end
    return sum
end

return function(laneName, progress)
    local points = Sensors.core.MissionInfo().corridors[laneName].points
    points = map(points, function(x) return x.position end)
    local laneLength = totalLength(points)  
    
    if progress < 0 then
        progress = 0
    elseif progress > 1 then
        progress = 1
    end

    local targetLength = progress * laneLength
    local length = 0

    for i = 1,(#points-1) do
        local a = points[i]
        local b = points[i + 1]
        local l = segmentLength(a, b)

        if length + l >= targetLength then
            return a + (b - a) * (targetLength - length) / l
        end

        length = length + l
    end

    return points[#points]
end
