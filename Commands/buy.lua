VFS.Include("modules.lua")
VFS.Include(modules.attach.data.path .. modules.attach.data.head)
attach.Module(modules, "message")

function getInfo()
    return
    {
        onNoUnits = SUCCESS,
        tooltip = "Try to buy specified unit",
        parameterDefs =
        {
            { 
                name = "unitName",
                variableType = "expression",
                componentType = "editBox",
                defaultValue = "'armspy'",
            }
        }
    }
end

function Run(self, units, parameter)
    local price = bb.ms.buy[parameter.unitName]
    if not price then
        return FAILURE
    end

    if Spring.GetTeamResources(Spring.GetMyTeamID(), "metal") <= price then
        return FAILURE
    end

    message.SendRules(
    {
        subject = "swampdota_buyUnit",
        data = { unitName = parameter.unitName }
    })
    
    return SUCCESS
end

function Reset(self) end
