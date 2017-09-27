# Find the number with the most digits.

# If two numbers in the argument array have the same number of digits,
# return the first one in the array.

# MY SOLUTION
def find_longest(arr)
  arr.max_by { |x| x.to_s.length }
end


p find_longest([1, 10, 100])# 100)
p find_longest([9000, 8, 800])# 9000)
p find_longest([8, 900, 500])# 900)
p find_longest([3, 40000, 100])# 40000)
p find_longest([1, 200, 100000])# 100000)
