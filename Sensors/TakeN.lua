local sensorInfo = {
	name = "TakeN",
	desc = "",
	author = "KCKy",
	date = "2025-08-11",
	license = "MIT",
}

function getInfo() return { period = -1 } end

return function(list, n)
  local result = {}

  if #list < n then
    return nil
  end

  while n > 0 do
    result[#result+1] = list[#list]
    list[#list] = nil
    n = n - 1
  end

  return result
end
