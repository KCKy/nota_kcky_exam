local sensorInfo = {
	name = "FilterArea",
	desc = "Give units in given circular area",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains

return function(units, position, radius)
  return filter(units, function(x) return (Vec3(Spring.GetUnitPosition(x)) - position):Length() < radius end)
end
