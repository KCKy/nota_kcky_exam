local sensorInfo = {
    name = "GetStrongpoint",
    desc = "Get ally strongpoints positions of a given lane",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains

return function(laneName)
    local points = bb.ms.corridors[laneName].points
    return filter(points, function(x) return x.isStrongpoint and x.ownerAllyID == Spring.GetMyAllyTeamID() end)
end

