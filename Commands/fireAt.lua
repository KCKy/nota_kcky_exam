function getInfo()
    return {
        onNoUnits = SUCCESS,
        tooltip = "Fire at given unit (adapted from nota_mestek_labs)",
        parameterDefs = {
            { 
                name = "unitsVariable",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "",
            },
            { 
                name = "targetVariable",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "",
            },
        }
    }
end

function Run(self, units, parameter)    
    for _, unitID in ipairs(bb[parameter.unitsVariable]) do
        Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE,{0},{})
        Spring.GiveOrderToUnit(unitID, CMD.ATTACK,{bb[parameter.targetVariable]},{})
    end

    return RUNNING
end

function Reset() end
