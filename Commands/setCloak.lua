function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Set the cloak state of units",
        parameterDefs = {			
        { 
            name = "units",
            variableType = "expression",
            componentType = "editBox",
            defaultValue = "units",
        },	
        { 
            name = "active",
            variableType = "expression",
            componentType = "editBox",
            defaultValue = "false",
        }}
    }
end

function Run(self, units, params)
    local mode
    if params.active then
        mode = 1
    else
        mode = 0
    end

    for _, unit in ipairs(params.units) do
        Spring.GiveOrderToUnit(unit, CMD.CLOAK, {mode}, 0)
    end
    return SUCCESS
end

function Reset(self)
	return self
end
