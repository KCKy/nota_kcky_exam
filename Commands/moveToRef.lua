function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Continuously move units to given reference",
		parameterDefs =
        {
            {
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "units"
            },
            {
                name = "positionRef",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            }
        }
    }
end

function Run(self, units, parameter)
    for _, unit in ipairs(parameter.units) do
        Spring.GiveOrderToUnit(unit, CMD.MOVE, bb[parameter.positionRef]:AsSpringVector(), {})
    end
    return RUNNING
end

function Reset(self)
	return self
end
