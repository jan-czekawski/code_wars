# Create a function that returns the sum of the two lowest positive 
# numbers given an array of minimum 4 integers. No floats or empty arrays will be passed.

# For example, when an array is passed like [19,5,42,2,77], the output should be 7.

# [10,343445353,3453445,3453545353453] should return 3453455.

# Hint: Do not modify the original array.

# MY SOLUTION
def sum_two_smallest_numbers(numbers)
  numbers.sort.first(2).inject(:+)
end

# BEST SOLUTION
def sum_two_smallest_numbers(numbers)
  numbers.min(2).reduce(:+)
end

def sum_two_smallest_numbers1(numbers)
  numbers.sort[0..1].inject(:+)
end

def sum_two_smallest_numbers(numbers)
  # numbers.sort.select { |n| n > 0 }.take(2).reduce(0, :+)
  numbers.select { |num| num > 0 }.min(2).inject(:+)
end

p sum_two_smallest_numbers([5, 8, 12, 18, 22])# 13) 
p sum_two_smallest_numbers([7, 15, 12, 18, 22])# 19) 
p sum_two_smallest_numbers([25, 42, 12, 18, 22])# 30) 

# require "benchmark"
# n = 1000_000
# Benchmark.bm do |x|
#   x.report { n.times {sum_two_smallest_numbers([6, 412, 123, 123, 11, 32234, 343243])} }
#   x.report { n.times {sum_two_smallest_numbers1([6, 412, 123, 123, 11, 32234, 343243])} }
# end