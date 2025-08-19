function getInfo()
	return {
		onNoUnits = SUCCESS, -- instant success
		tooltip = "Spy seek shika",
		parameterDefs = {
			{ 
				name = "spyID",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			},
			{ 
				name = "seekPosition",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end

-- Adapted from nota_sirwok_exam

function Reset(self) end

function Run(self, units, parameter)
    local shika = Sensors.nota_kcky_exam.FindClosestEnemyShikaID("Middle")
	shika = shika and Vec3(Spring.GetUnitPosition(shika))
    local seek_pos = parameter.seekPosition
	if parameter.spyID == nil or parameter.seekPosition == nil then
		return FAILURE
	end

	if not Spring.ValidUnitID(parameter.spyID) then
		return FAILURE
	end

    local x,y,z = Spring.GetUnitPosition(parameter.spyID)

    if shika ~= nil then
        Spring.GiveOrderToUnit(parameter.spyID, CMD.STOP,{},{})
        Spring.GiveOrderToUnit(parameter.spyID, CMD.MOVE,{shika.x - 100,shika.y,shika.z +100},{})
		return SUCCESS
	end

	Spring.GiveOrderToUnit(parameter.spyID, CMD.MOVE,{seek_pos.x,seek_pos.y,seek_pos.z}, {})

	return RUNNING
end