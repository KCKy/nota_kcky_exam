local sensorInfo = {
	name = "Map",
	desc = "Map a list",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list, f)
  local result = { }
  for i,x in pairs(list) do
    result[i] = f(x)
  end
  return result
end
