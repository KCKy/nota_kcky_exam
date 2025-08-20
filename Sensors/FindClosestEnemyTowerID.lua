local sensorInfo = {
	desc = "Find closest enemy tower on a given line",
	license = "MIT",
}

function getInfo() return { period = -1 } end

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains
local ids = {"shika", "dca", "corvipe", "armguard", "corfus"}

-- Adapted from nota_kyzro_swampdota, which was inspired by nota_sirwok_exam
return function(laneName)
    local points = Sensors.core.missionInfo().corridors[laneName].points
    for _, node in ipairs(points) do
        local position = node.position
        local closeUnits = Spring.GetUnitsInSphere(position.x, position.y, position.z, 300)
        for _, closeUnitID in ipairs(closeUnits) do
            if UnitDefs[Spring.GetUnitDefID(closeUnitID)].name == "shika"
                and not Spring.IsUnitAllied(closeUnitID) then
                return closeUnitID
            end
        end
        --[[
        for _, closeUnitID in ipairs(closeUnits) do
            if contains(ids, UnitDefs[Spring.GetUnitDefID(closeUnitID)].name)
                and not Spring.IsUnitAllied(closeUnitID) then
                return closeUnitID
            end
        end
        --]]
    end
	return nil
end
