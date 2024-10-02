local comb = require("comb")
local sort = require("sort")

local data = { 1, 2, 3, 4, 5, 6 }
local counter = 0
local k = 4

for _ = 1, comb.C(#data, k) do
  local list = comb.GenComb(data, k)
  counter = counter + 1
  print(counter .. " | " .. sort.show(list))
end
