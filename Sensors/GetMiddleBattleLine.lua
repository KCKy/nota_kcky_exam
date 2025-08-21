local sensorInfo = {
    name = "GetMiddleBattleLine",
    desc = "Get battle line of the middle lane",
    author = "KCKy",
    date = "2025-08-21",
    license = "MIT",
}

function getInfo() return { period = -1 } end

local filter = Sensors.nota_kcky_exam.Filter
local flatten = Sensors.nota_kcky_exam.Flatten
local map = Sensors.nota_kcky_exam.Map
local max = Sensors.nota_kcky_exam.Max
local contains = Sensors.nota_kcky_exam.Contains
local project = Sensors.nota_kcky_exam.ProjectMiddle

local function projectMap(x)
    return project(Vec3(Spring.GetUnitPosition(x)))
end

return function(maxDistance)
    local friends = Spring.GetTeamUnits(bb.ms.battleLines.GoodMiddle.teamID)
    local mine = filter(Spring.GetTeamUnits(Spring.GetMyTeamID()), function(x) return UnitDefs[Spring.GetUnitDefID(x)].name ~= 'armspy' end)

    friends = map(friends, projectMap)
    mine = map(mine, projectMap)

    friends = max(friends)
    mine = max(mine)

    local unit = max({friends, mine})
    return unit or 0
end

