function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Give the stop command to given units",
		parameterDefs =
        {
            {
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "units"
            }
        }
    }
end

function Run(self, units, parameter)
    for _, unit in ipairs(parameter.units) do
        Spring.GiveOrderToUnit(unit, CMD.STOP, {}, {})
    end

    return SUCCESS
end

function Reset() end
