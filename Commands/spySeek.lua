function getInfo()
	return
	{
		onNoUnits = SUCCESS,
		tooltip = "Make spy seek to the closes shika tower on the middle line (adapted from nota_sirwok_exam)",
		parameterDefs =
		{
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
			},
			{ 
				name = "offset",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "",
			}
		}
	}
end

function Run(self, units, parameter)
    local shika = Sensors.nota_kcky_exam.FindClosestEnemyTowerID("Middle")
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
        Spring.GiveOrderToUnit(parameter.spyID, CMD.MOVE, (shika+parameter.offset):AsSpringVector(),{})
		return SUCCESS
	end

	Spring.GiveOrderToUnit(parameter.spyID, CMD.MOVE,{seek_pos.x,seek_pos.y,seek_pos.z}, {})

	return RUNNING
end

function Reset(self) end
