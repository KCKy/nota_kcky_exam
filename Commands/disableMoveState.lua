function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Order units to not wander to fight",
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

function Run(self, units, params)
    for _, unit in ipairs(params.units) do
        Spring.GiveOrderToUnit(unit, CMD.MOVE_STATE, {0}, {"shift"})
    end

    return SUCCESS
end

function Reset() end
