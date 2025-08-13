local sensorInfo = {
	name = "DistanceToLane",
	desc = "Given a lane name and Vec3 position returns aproximates distance to the given lane",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max

return function(lane, position)
  	local points = Sensors.core.MissionInfo().corridors[lane].points
	local distances = map(points, function(x) return (x.position - position):Length() end)
  	return max(distances, function(x, y) return x < y end)
end
