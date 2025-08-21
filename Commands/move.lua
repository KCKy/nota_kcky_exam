function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Continuously move units to given position",
		parameterDefs =
        {
            {
                name = "units",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "units"
            },
            {
                name = "position",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "Vec3(0, 0, 0)"
            }
        }
    }
end

function Run(self, units, parameter)
    for _, unit in ipairs(parameter.units) do
        Spring.GiveOrderToUnit(unit, CMD.MOVE, parameter.position:AsSpringVector(), {})
    end
    
    return RUNNING
end

function Reset() end
