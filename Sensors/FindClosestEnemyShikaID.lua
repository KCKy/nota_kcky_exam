local sensorInfo = {
	desc = "Find closest enemy Shika tower on a given line",
	license = "MIT",
}

function getInfo() return { period = -1 } end

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
    end
	return nil
end
