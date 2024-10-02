local sort = {}

function sort.swap(data, a, b)
	local temp = data[a]
	data[a] = data[b]
	data[b] = temp
end

local function min(data, a, b)
  local minValue = a
  for i = a+1, b do
  	if data[minValue] > data[i] then
  	  minValue = i
  	end
  end
  return minValue
end

local function max(data, a, b)
  local maxValue = a
  for i = a+1, b do
  	if data[maxValue] < data[i] then
  	  maxValue = i
  	end
  end
  return maxValue
end

function sort.show(data)
   return table.concat(data, " ")
end

-- Bubble sort
function sort.bubble(data, reverse, first, last)
  local flag = false
  local iterations = 0
  local swaps = 0
  local innerIterations = 0
  first = first or 1
  last = last or #data
  reverse = reverse or false

  for i = first, last do
    iterations = iterations + 1
    if flag == true then
      break
    end
    flag = true

    for j = last, i, -1 do
      innerIterations = innerIterations + 1
      if j ~= first and ( ( not reverse and data[j] < data[j-1] ) or ( reverse and data[j] > data[j-1] ) ) then
        sort.swap(data, j, j-1)
        swaps = swaps + 1
        flag = false
      end
    end
  end
  print("Outer cycle iterations: " .. iterations)
  print("Inner cycle iterations: " .. innerIterations)
  print("Swaps: " .. swaps)
end

-- Insertion sort
function sort.insert(data, reverse, first, last)
  first = first or 1
  last = last or #data
  reverse = reverse or false
  local iterations = 0
  local shifts = 0

	for i = first+1, last do
	  local temp = data[i]
	  local j = i - 1
	  iterations = iterations + 1

    -- Shift of table elements
    while j >= first and ( ( not reverse and data[j] > temp ) or ( reverse and data[j] < temp ) ) do
      data[j+1] = data[j]
      j = j - 1
      shifts = shifts + 1
    end

    -- Insertion of element from buffer
    data[j+1] = temp
  end
end

-- Selection sort
function sort.select(data, reverse, first, last)
  first = first or 1
  last = last or #data
  reverse = reverse or false
  local iterations = 0
  local innerIterations = 0
  local swaps = 0

  for i = first, last do
    iterations = iterations + 1
    if not reverse then
      MinValue = i
      for j = i+1, last do
        innerIterations = innerIterations + 1
      	if data[MinValue] > data[j] then
      	  MinValue = j
      	end
      end
    else
      MinValue = i
      for j = i+1, last do
        innerIterations = innerIterations + 1
      	if data[MinValue] < data[j] then
      	  MinValue = j
      	end
      end
    end

    if MinValue ~= i then
    	sort.swap(data, i, MinValue)
    	swaps = swaps + 1
    end
  end
  print("Outer cycle iterations: " .. iterations)
  print("Inner cycle iterations: " .. innerIterations)
  print("Swaps: " .. swaps)
end
 return sort
