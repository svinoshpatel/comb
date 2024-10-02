local comb = require("comb")
local sort = require("sort")

local data = { 1, 2, 3, 4, 5, 6 }
local counter = 1

print(counter .. " | " .. sort.show(data))
for _ = 1, comb.factorial(#data)-1 do
  comb.GenPerm(data)
  counter = counter + 1
  print(counter .. " | " .. sort.show(data))
end
