# The number 89 is the first integer with more than one digit that 
# fulfills the property partially introduced in the title of this 
# kata. What's the use of saying "Eureka"? Because this sum gives the same number.

# In effect: 89 = 8^1 + 9^2

# The next number in having this property is 135.

# See this property again: 135 = 1^1 + 3^2 + 5^3

# We need a function to collect these numbers, that may receive 
# two integers a, b that defines the range [a, b] (inclusive) and 
# outputs a list of the sorted numbers in the range that fulfills 
# the property described above.

# Let's see some cases:

# sum_dig_pow(1, 10) == [1, 2, 3, 4, 5, 6, 7, 8, 9]

# sum_dig_pow(1, 100) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 89]
# If there are no numbers of this kind in the range [a, b] the function 
# should output an empty list.

# sum_dig_pow(90, 100) == []
# Enjoy it!!

# MY SOLUTION
def sum_dig_pow(a, b)
  (a..b).select do |num| 
    num == num.to_s
              .chars
              .map
              .with_index(1) { |dig, idx| dig.to_i**idx }
              .inject(:+)
  end
end

p sum_dig_pow(1, 10)# [1, 2, 3, 4, 5, 6, 7, 8, 9])
p sum_dig_pow(1, 100)# [1, 2, 3, 4, 5, 6, 7, 8, 9, 89])
p sum_dig_pow(10, 100)#  [89])
p sum_dig_pow(90, 100)# [])
p sum_dig_pow(90, 150)# [135])
p sum_dig_pow(50, 150)# [89, 135])
p sum_dig_pow(10, 150)# [89, 135])