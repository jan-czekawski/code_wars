# Welcome. In this kata, you are asked to square every digit of a number.

# For example, if we run 9119 through the function, 811181 will come out.

# Note: The function accepts an integer and returns an integer

# MY SOLUTION
def square_digits(num)
  raise "Number should be integer" unless num.is_a?(Integer)
  
  num.to_s.split("").map { |x| x.to_i**2 }.join.to_i
end

# BEST SOLUTION
def square_digits(num)
  num.to_s.chars.map { |x| x.to_i**2 }.join.to_i
end

p square_digits(3212), square_digits(2112), square_digits(1111),
     square_digits(0), square_digits(1234321)
