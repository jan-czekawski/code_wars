# Write a function, persistence, that takes in a positive parameter num 
# and returns its multiplicative persistence, which is the number of 
# times you must multiply the digits in num until you reach a single digit.

# For example:

# persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
#                 # and 4 has only one digit

# persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
#                   # 1*2*6=12, and finally 1*2=2

# persistence(4) # returns 0, because 4 is already a one-digit number
 
# MY SOLUTION
def persistence(n)
  i = 0
  until n.to_s.length == 1
    n = n.to_s
        .chars
        .map(&:to_i)
        .inject(:*)  
    
    i += 1
  end
  i
end

# # BEST SOLUTION
def persistence(n, x=0)
  n < 10 ? x : persistence(n.to_s.chars.reduce(1) {|s, v| s * v.to_i }, x + 1)
end

def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end

p persistence(39)#3)
p persistence(4)#0)
p persistence(25)#2)
p persistence(999)#4)


# require "benchmark"

# n = 200_000
# Benchmark.bm do |x|
#   x.report { n.times { persistence(999) }  }
# end