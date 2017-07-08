# Consider a sequence u where u is defined as follows:

# The number u(0) = 1 is the first one in u.
# For each x in u, then y = 2 * x + 1 and z = 3 * x + 1 must be in u too.
# There are no other numbers in u.
# Ex: u = [1, 3, 4, 7, 9, 10, 13, 15, 19, 21, 22, 27, ...]

# 1 gives 3 and 4, then 3 gives 7 and 10, 4 gives 9 and 13, then 7 gives 15 and 22 and so on...

# #Task: Given parameter n the function dbl_linear (or dblLinear...) 
# returns the element u(n) of the ordered (with <) sequence u.

# #Example: dbl_linear(10) should return 22

# #Note: Focus attention on efficiency


MY SOLUTION
def multiply(arr, beg, result)
  while arr[result*5].nil?
    arr.push(2 * arr[beg] + 1).push(3 * arr[beg] + 1).uniq!
    arr.sort!
    multiply(arr, beg + 1 ,result)
  end
end

def dbl_linear(n)
  seq = [1]
  multiply(seq, 0, n)  
  seq[n]
end

# def multiply(arr, beg, result)
#   while arr[result**2].nil?
#     arr.push(2 * arr[beg] + 1).push(3 * arr[beg] + 1).uniq!
#     arr.sort!
#     multiply(arr, beg + 1 ,result)
#   end
# end

# def dbl_linear(n)
#   seq = [1]
#   x = 0
#   n_times = n*2
#   n_times.times do |j|
#     y = 2 * seq[x] + 1
#     z = 3 * seq[x] + 1
#     if seq.include?(y)
#     else
#       seq.push(y)
#     end
#     if seq.include?(z)
#     else
#       seq.push(z)
#     end
#     seq.sort!
#     x += 1
#   end
#   seq[n]
# end


# def dbl_linear(n)
#   seq = [1]
#   x = 0
#   n_times = n*2
#   n_times.times do |j|
#     i = seq[x]
#     y = 2 * i + 1
#     z = 3 * i + 1
#     if seq.include?(y)
#     else
#       seq.push(y)
#     end
#     if seq.include?(z)
#     else
#       seq.push(z)
#     end
#     seq.sort!
#     x += 1
#   end
#   seq[n]
# end



# BEST SOLUTION
def is_in_u(q, u)
  low = 0
  high = u.size - 1
  while low <= high
    mid = (low + high) / 2
    if u[mid] == q
      return true
    elsif u[mid] > q
      high = mid - 1
    else
      low = mid + 1
    end
  end
  if q > u[mid]
    return [false, mid + 1]
  elsif q < u[mid]
    return [false, mid]
  else
    puts "sth wrong"
  end
end

def dbl_linear(n)
  u = [1]
  
  u.each_with_index do |num, index|
    jx = is_in_u(2 * num + 1, u)
    if jx != true
      u.insert(jx[1], 2 * num + 1)
    end
    jy = is_in_u(3 * num + 1 , u)
    if jy != true
      u.insert(jy[1], 3 * num + 1)
    end
    break if index == n*3/5
  end
  u[n]  
end


p dbl_linear(10) #, 22)
p dbl_linear(20) #, 57)
p dbl_linear(30) #, 91)
p dbl_linear(50) #, 175)
# p dbl_linear(50000)