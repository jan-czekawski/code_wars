# In this little assignment you are given a string of space
# separated numbers, and have to return the highest and lowest number.

# Example:

# high_and_low("1 2 3 4 5")  # return "5 1"
# high_and_low("1 2 -3 4 5") # return "5 -3"
# high_and_low("1 9 3 4 -5") # return "9 -5"
# Notes:

# All numbers are valid Int32, no need to validate them.
# There will always be at least one number in the input string.
# Output string must be two numbers separated by a single space, and highest number is first.

# MY SOLUTION
def high_and_low(numbers)
  arr = numbers.split.map(&:to_i).sort
  arr.size > 1 ? "#{arr.pop} #{arr.shift}" : "#{arr[0]} #{arr[0]}"
end

# BEST SOLUTIONS
def high_and_low(numbers)
  numbers.split.map(&:to_i).minmax.reverse.join(' ')
end

def high_and_low(numbers)
  numbers = numbers.split.map(&:to_i)
  "#{numbers.max} #{numbers.min}"
end

def high_and_low(numbers)
  a = numbers.split.map(&:to_i).sort
  "#{a.last} #{a.first}"
end

# Runtime of .sort is O(n*log(n)) but this task can easily be solved in O(n) time.
# For sufficiently large datasets this solution will be slower than most other suggested solutions

p high_and_low("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6") # "542 -214")
p high_and_low("1 -1") # "1 -1")
p high_and_low("1 1") # "1 1")
p high_and_low("-1 -1") # "-1 -1")
p high_and_low("1 -1 0") # "1 -1")
p high_and_low("1 1 0") # "1 0")
p high_and_low("-1 -1 0") # "0 -1")
p high_and_low("42") # "42 42")