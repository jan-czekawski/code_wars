# Write a function that accepts an array of 10 integers
# (between 0 and 9), that returns a string of those numbers
# in the form of a phone number.

# Example:

# createPhoneNumber(Array[1, 2, 3, 4, 5, 6, 7, 8, 9, 0])
# # => returns "(123) 456-7890"
# The returned format must be correct in order to complete
# this challenge. 
# Don't forget the space after the closing parenthese!

# MY SOLUTION
def createPhoneNumber(numbers)
  numbers.join.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

# BEST SOLUTIONS
def createPhoneNumber(array)
  '(%d%d%d) %d%d%d-%d%d%d%d' % array
end

def createPhoneNumber(digits)
  area_code, prefix, *extension = digits.each_slice(3).map(&:join)
  "(#{area_code}) #{prefix}-#{extension.join}"
end

p createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])#, "(123) 456-7890");

# require "benchmark"
# n = 100000
# Benchmark.bm do |x|
#   x.report { n.times { createPhoneNumber1([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) } }
#   x.report { n.times { createPhoneNumber2([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) } }
# end