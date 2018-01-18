# Create a function named divisors that takes an integer and returns an array 
# with all of the integer's divisors(except for 1 and the number itself).
# If the number is prime return the string '(integer) is prime' 
# (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).

# Example:

# divisors(12); #should return [2,3,4,6]
# divisors(25); #should return [5]
# divisors(13); #should return "13 is prime"
# You can assume that you will only get positive integers as inputs.

# MY SOLUTIONS
def divisors(n)
  div = Array.new
  curr = n - 1
  while curr > 1
    div.unshift(curr) if n % curr == 0
    curr -= 1
  end
  div.empty? ? "#{n} is prime" : div
end

def divisors(n)
  int = (2..n-1).select { |num| n % num == 0 }
  int.empty? ? "#{n} is prime" : int
end

# BEST SOLUTIONS
def divisors(n)
  vals = (2..n/2).select{|x| n%x==0}
  vals.empty? ? "#{n} is prime" : vals
end
  
p divisors(4)
p divisors(9)
p divisors(15)# [3,5])
p divisors(13)# [3,5])
p divisors(253)# [11,23])
p divisors(24)# [2,3,4,6,8,12])