function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Order and wait for self destruct",
		parameterDefs = {			
        { 
            name = "units",
            variableType = "expression",
            componentType = "editBox",
            defaultValue = "units",
        }}
    }
end

function Run(self, units, parameters)
    for _, unit in ipairs(parameters.units) do
        Spring.GiveOrderToUnit(unit, CMD.SELFD, {}, {})
    end

    return SUCCESS
end

function Reset(self)
	return self
end
