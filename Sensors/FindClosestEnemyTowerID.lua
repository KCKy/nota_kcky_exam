local sensorInfo = {
    name = "FindClosestEnemyTowerID",
    desc = "Find closest enemy tower on a given line (adapted from nota_kyzro_swampdota)",
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
    for _, node in ipairs(points) do
        local position = node.position
        local closeUnits = Spring.GetUnitsInSphere(position.x, position.y, position.z, 800)
        for _, closeUnitID in ipairs(closeUnits) do
            if UnitDefs[Spring.GetUnitDefID(closeUnitID)].name == "shika"
                and not Spring.IsUnitAllied(closeUnitID) then
                return closeUnitID
            end
        end
        for _, closeUnitID in ipairs(closeUnits) do
            if UnitDefs[Spring.GetUnitDefID(closeUnitID)].name == "armllt"
                and not Spring.IsUnitAllied(closeUnitID) then
                return closeUnitID
            end
        end
                for _, closeUnitID in ipairs(closeUnits) do
            if UnitDefs[Spring.GetUnitDefID(closeUnitID)].name == "corlab"
                and not Spring.IsUnitAllied(closeUnitID) then
                return closeUnitID
            end
        end
    end
	return nil
end
