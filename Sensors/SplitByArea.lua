local sensorInfo = {
	name = "FilterUnitsInArea",
	desc = "Get unoccupied units by categories.",
	author = "Jakub Mestek",
	date = "2021-07-26",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1 -- actual, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT
	}
end

local UnitPosition = Sensors.nota_mestek_labs.UnitPosition



-- @description return get units
return function(unitsIDs,area)
	local inArea = {}
	local notInArea = {}
	local toRemove = {}
    for idx,unitID in ipairs(unitsIDs) do
		local pos = UnitPosition(unitID)
		if (pos - area.center):Length() < area.radius then
			inArea[#inArea+1] = unitID
			toRemove[#toRemove+1] = idx
		else
			notInArea[#notInArea+1] = unitID
		end
    end
	for i = #toRemove, 1, -1 do
        table.remove(unitsIDs, toRemove[i])
    end
	return { inArea = inArea, notInArea = notInArea }
end