VFS.Include("modules.lua")
VFS.Include(modules.attach.data.path .. modules.attach.data.head)
attach.Module(modules, "message")

function getInfo()
	return
	{
		onNoUnits = SUCCESS,
		tooltip = "Upgrade given lane",
		parameterDefs =
		{
			{ 
				name = "lineName",
				variableType = "expression",
				componentType = "editBox",
				defaultValue = "'GoodMiddle'",
			}
		}
	}
end

function Run(self, units, parameter)
	local price = Sensors.core.MissionInfo().upgrade.line
	if not price then
		return FAILURE
	end

	if Spring.GetTeamResources(Spring.GetMyTeamID(), "metal") <= price then
		return FAILURE
	end

    message.SendRules(
	{
        subject = "swampdota_upgradeLine",
        data =
		{
			lineName = parameter.lineName,
			upgradeLevel = 1,
		}
    })
	
	return SUCCESS
end

function Reset(self) end
