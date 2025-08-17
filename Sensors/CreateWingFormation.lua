local sensorInfo = {
	name = "CreateWingFormation",
	desc = "Create a wing formation of points",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(gap, leaderDirection, count)
    leaderDirection = leaderDirection:Normalize()
    local leftWing = leaderDirection:Rotate2D(-90) * gap
    local rightWing = -leftWing
    local result = {}

    for i=1,count do
        local index = math.floor(i / 2) + 1
        local target
        if i % 2 == 0 then
            target = leftWing * index
        else
            target = rightWing * index
        end
        result[i] = target
    end

    return result
end
