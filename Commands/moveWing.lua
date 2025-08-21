function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Move group as two wings of a position",
		parameterDefs =
        {
            {
                name = "unitsVariable",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "positionVariable",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "direction",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "gap",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = ""
            },
            {
                name = "attack",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "false"
            }
        }
    }
end

local commandName = "moveWing"

function Run(self, units, parameter)
    local leaderPosition = bb[parameter.positionVariable]
    if leaderPosition == nil then
        return RUNNING
    end

    local leaderDirection = parameter.direction
    local gap = parameter.gap

    leaderDirection = leaderDirection:Normalize()
    local leftWing = leaderDirection:Rotate2D(-90) * gap
    local rightWing = -leftWing

    for i, unit in ipairs(bb[parameter.unitsVariable]) do
        i = i - 1
        local index = math.floor(i / 2) + 1
        local target
        if i % 2 == 0 then
            target = leaderPosition + leftWing * index
        else
            target = leaderPosition + rightWing * index
        end

        if attack then
            Spring.GiveOrderToUnit(unit, CMD.FIGHT, target:AsSpringVector(), {})    
            
        else
            Spring.GiveOrderToUnit(unit, CMD.MOVE, target:AsSpringVector(), {})    
        end
    end

    return RUNNING
end

function Reset() end
