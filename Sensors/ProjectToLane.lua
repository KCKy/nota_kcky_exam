local sensorInfo = {
    name = "ProjectToLane",
    desc = "Project a position to a lane, returns 0 - 1",
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
    return direction:DotProduct(pointRelative)
end

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

return function(laneName, position)
    local points = bb.ms.corridors[laneName].points
	points = map(points, function(x) return x.position end)
    local laneLength = totalLength(points)
    local length = 0
    for i=1,(#points-1) do
        local l = segmentLength(points[i], points[i+1])
        local projection = projectLine(points[i], points[i+1], position)
        if projection < 0 then
            break
        elseif projection >= l then
            length = length + l
        else
            length = length + projection
            break
        end
    end
    return length / laneLength
end
