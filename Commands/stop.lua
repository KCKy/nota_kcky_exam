function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Stop",
		parameterDefs =
        {
            {
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            }
        }
    }
end

local commandName = "stop"

function Run(self, units, parameter)
    for _, unit in ipairs(parameter.units) do
        Spring.GiveOrderToUnit(unit, CMD.STOP, {}, {})
    end
    return SUCCESS
end

function Reset(self)
end
