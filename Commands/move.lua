function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Move some units",
		parameterDefs =
        {
            {
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "position",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            }
        }
    }
end

local commandName = "move"

function Run(self, units, parameter)
    for _, unit in ipairs(parameter.units) do
        Spring.GiveOrderToUnit(unit, CMD.MOVE, parameter.position:AsSpringVector(), {})
    end

    return RUNNING
end

function Reset()
end
