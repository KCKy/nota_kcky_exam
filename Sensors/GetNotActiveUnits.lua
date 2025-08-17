local sensorInfo = {
	name = "GetNotActiveUnits",
	desc = "Get units of specified type which are not in the given list",
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

return function(desired, activeUnits)
	local function valid(x)
		if (not Spring.ValidUnitID(x)) or Spring.GetUnitIsDead(x) ~= false then
			return false
		end

		if not contains(desired, UnitDefs[Spring.GetUnitDefID(x)].name) then
			return false
		end

		return not contains(activeUnits, x)
	end

	local units = Spring.GetTeamUnits(Spring.GetMyTeamID())
	return filter(units, valid)
end
