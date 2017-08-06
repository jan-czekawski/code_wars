# Is Prime

# Define a function isPrime that takes one integer argument and returns 
# true or false depending on if the integer is a prime.

# Per Wikipedia, a prime number (or a prime) is a natural number greater 
# than 1 that has no positive divisors other than 1 and itself.

# Example

# isPrime(5)
# => true
# Assumptions

# You can assume you will be given an integer input.
# You can not assume that the integer will be only positive. You may 
# be given negative numbers.

# Test if number is prime

# MY SOLUTION
def isPrime(num)
  return false if num <= 1
  (2...num).each { |div| return false if num % div == 0 }
  true
end

# BEST SOLUTIONS
require "prime"
def isPrime(num)
  num.prime?
end


def isPrime(num)
  return false if num <= 1
  # (2..num**(1/2.0)).each { |div| return false if num % div == 0 }
  # (2..num**0.5).each { |div| return false if num % div == 0 }
  (2..Math.sqrt(num)).each { |div| return false if num % div == 0 }
  true
end

def isPrime(num)
  num < 2 ? false : (2..Math.sqrt(num)).none?{|i| num%i == 0}
end

p isPrime(2)# true)
p isPrime(4)# false)
p isPrime(11)# true)
p isPrime(300)# false)