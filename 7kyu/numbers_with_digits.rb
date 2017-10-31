# You have to search all numbers from inclusive 1 to inclusive a given number x
# that have the given digit d in it.
# The value of d will always be 0 - 9.
# The value of x will always be greater than 0.

# You have to return as an array

# the count of these numbers,

# their sum 

# and their product.


# For example:

# x = 11
# d = 1
# ->
# Numbers: 1, 10, 11
# Return: [3, 22, 110]

# If there are no numbers, which include the digit, return [0,0,0]. 

# Have fun coding it and please don't forget to vote and rank this kata! :-) 

# I have created other katas. Have a look if you like coding and challenges.

# MY SOLUTION
def numbers_with_digit_inside(x, d)
  arr = []
  (1..x).each { |item| arr.push(item) if item.to_s =~ /#{d}/ }
  return [0, 0, 0] if arr.count == 0 
  [arr.count, arr.inject(&:+), arr.inject(&:*)]
end

# OTHER SOLUTIONS
def numbers_with_digit_inside(x, d)
  nums = ('1'..x.to_s).select { |num| num.include?(d.to_s) }.map(&:to_i)
  [nums.size, nums.reduce(0, :+), nums.reduce(:*) || 0]
end

module ArrayMath
  refine Array do
    def sum
      reduce(0,:+)
    end

    def product
      empty? ? 0 : reduce(1,:*)
    end
  end
end

using ArrayMath

def numbers_with_digit_inside(x, d)
  contains_x = (1..x).select { |n| n.to_s[/#{d}/] }
  [contains_x.count, contains_x.sum, contains_x.product]
end

def numbers_with_digit_inside(x, d)
  (1..x).select{|i| /#{d}/ =~ i.to_s}.instance_eval{[size, reduce(0,:+), reduce(:*)||0]}
end

def numbers_with_digit_inside(x, d)
  numbers = (1..x).select do |i|
    i.to_s.include?(d.to_s)
  end

  numbers.size.zero? ? [0, 0, 0] : [numbers.size, numbers.reduce(:+), numbers.reduce(:*)]
end


p numbers_with_digit_inside(5, 6)# [0, 0, 0])
p numbers_with_digit_inside(7, 6)# [1, 6, 6])
p numbers_with_digit_inside(11, 1)# [3, 22, 110])
p numbers_with_digit_inside(20, 0)# [2, 30, 200])
p numbers_with_digit_inside(44, 4)# [9, 286, 5955146588160])