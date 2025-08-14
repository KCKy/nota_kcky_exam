local sensorInfo = {
	name = "FilterTaken",
	desc = "Filter a list to exclude items in a different list",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local contains = Sensors.nota_kcky_exam.Contains
local filter = Sensors.nota_kcky_exam.Filter

return function(list, second)
  return filter(list, function(x) return not contains(second, x) end)
end
