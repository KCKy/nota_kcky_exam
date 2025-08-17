function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Continuously move units every tick by given vector",
		parameterDefs =
        {
            {
                name = "vector",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "Vec3(0, 0, 0)"
            },
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
    local vector = parameter.vector

    for _, unit in ipairs(parameter.units) do
        local position = Vec3(Spring.GetUnitPosition(unit))
        local target = position + vector
        Spring.GiveOrderToUnit(unit, CMD.MOVE, target:AsSpringVector(), {})
    end

    return RUNNING
end

function Reset(self)
	return self
end
