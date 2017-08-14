# A Narcissistic Number is a number which is the sum of its own 
# digits, each raised to the power of the number of digits.

# For example, take 153 (3 digits):

#     1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
# and 1634 (4 digits):

#     1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634
# The Challenge:

# Your code must return true or false depending upon whether the 
# given number is a Narcissistic number.

# Error checking for text strings or other invalid inputs is not 
# required, only valid integers will be passed into the function.

# MY SOLUTION
def narcissistic?(value)
  val_size = value.to_s.size
  value == value.to_s
                .chars
                .inject(0) { |sum, num| sum + (num.to_i)**val_size }
end

# BEST SOLUTIONS
def narcissistic?( value )
  v = value.to_s
  v.chars.collect { |c| c.to_i**(v.length) }.inject(&:+) == value
end

def narcissistic?( i )
  length = i.to_s.size
  i.to_s.chars.map{ |e| e.to_i**length }.inject(:+) == i
end

def narcissistic?( value )
  value == value.to_s.chars.map { |x| x.to_i**value.to_s.size }.reduce(:+)
end

def narcissistic?( value )
  digits = extract_digits_from(value)  
  value == expected_value_for(digits)
end

def extract_digits_from(number)
  number.to_s.chars.map(&:to_i)
end

def expected_value_for(digits)
  power = digits.size
  digits.inject(0) do |sum, digit|
    sum += digit ** power
  end
end

p narcissistic?(5)# == true, "5 is narcissistic" )
p narcissistic?(153) # == true, "153 is narcissistic" )


# require "benchmark"

# n = 100_000
# Benchmark.bm do |x|
#   x.report { n.times { narcissistic1?(123412341234987123498123) } }
#   x.report { n.times { narcissistic2?(123412341234987123498123) } }
#   x.report { n.times { narcissistic3?(123412341234987123498123) } }
#   x.report { n.times { narcissistic4?(123412341234987123498123) } }
#   x.report { n.times { narcissistic5?(123412341234987123498123) } }
# end