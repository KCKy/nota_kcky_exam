local sensorInfo = {
	name = "GetLaneBombingTargets",
	desc = "Get enemy units to be bombed in a lane",
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

return function(desired, lane, maxDistance, unit, close_threshold)
	local position = Vec3(Spring.GetUnitPosition(unit))

	local function valid(x)
		if (not Spring.ValidUnitID(x)) or Spring.GetUnitIsDead(x) ~= false then
			return false
		end

		if not contains(desired, UnitDefs[Spring.GetUnitDefID(x)].name) then
			return false
		end

		if (Vec3(Spring.GetUnitPosition(x)) - position):Length() > close_threshold then
			return false
		end

		return Sensors.nota_kcky_exam.DistanceToLane(lane, Vec3(Spring.GetUnitPosition(x))) <= maxDistance
	end

	
    local enemyTeams = Sensors.core.EnemyTeamIDs()
	local units = flatten(map(enemyTeams, Spring.GetTeamUnits))
	units = filter(units, valid)

	local function compare(x, y)
		local a = (Vec3(Spring.GetUnitPosition(x)) - position):Length()
		local b = (Vec3(Spring.GetUnitPosition(y)) - position):Length()
		return a < b
	end

	table.sort(units)
	
	return units
end
