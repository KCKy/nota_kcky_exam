local sensorInfo = {
	name = "GetBattleLine",
	desc = "Get battle line of the middle lane",
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

return function(maxDistance)
    local units = Spring.GetAllUnits()
    units = filter(units, function(x) return Spring.IsUnitAllied(x) and UnitDefs[Spring.GetUnitDefID(x)].name ~= 'armspy' end)
    units = map(units, function(x) return {id = x, pos = Vec3(Spring.GetUnitPosition(x))} end)
    units = filter(units, function(x) return math.abs((Game.mapSizeX - x.pos.x) - x.pos.z) <= maxDistance end)
    unit = max(units, function(x, y) return x.pos.x - x.pos.z > y.pos.x - y.pos.z end)
    return unit and Sensors.nota_kcky_exam.ProjectMiddle(unit.pos) or 0
end
