local comb = {}

local sort = require("sort")

function comb.factorial(n)
  if n == 0 then
    return 1
  else
    return n * comb.factorial(n - 1)
  end
end

function comb.A(n, k)
  return comb.factorial(n) / comb.factorial(n-k)
end

function comb._A(n, k)
  return n^k
end

function comb.C(n, k)
  return comb.factorial(n) / (comb.factorial(k) * comb.factorial(n-k))
end

function comb._C(n, k)
  return comb.factorial(n+k-1) / (comb.factorial(k) * comb.factorial(n-1))
end

function comb.GenPerm(A)
  if A[#A-1] < A[#A] then
    sort.swap(A, #A-1, #A)
  else
    local i = #A-1
    while i > 0 and A[i] >= A[i+1] do
      i = i - 1
    end

    if i == 0 then
      return nil
    end

    sort.insert(A, false, i+1)
    for k = i+1, #A do
      if A[k] > A[i] then
        sort.swap(A, k, i)
        break
      end
    end
  end
end

function comb.GenComb(A, k)
  if kata == nil then
    kata = {}
    for element = 1, k do
      table.insert(kata, element)
    end
    return kata
  end

  for i = k, 1, -1 do
    if kata[i] < #A - k + i then
      kata[i] = kata[i] + 1
      for j = i+1, k do
        kata[j] = kata[j-1] + 1
      end
      return kata
    end
  end
  return nil
end

return comb
