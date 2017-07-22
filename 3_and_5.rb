# If we list all the natural numbers below 10 that are multiples 
# of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the 
# multiples of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# MY SOLUTION
def solution(number)
  (1..number-1).select { |num| num % 3 == 0 || num % 5 == 0}.inject(:+)
  # (1..number-1).select { |num| num % 3 == 0 || num % 5 == 0}.inject(0, :+)
  # (1..number-1).select { |num| num % 3 == 0 || num % 5 == 0}.inject(:+) || 0
end

# BEST SOLUTIONS
def solution(number)
  # (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+)
  (1...number).select { |i| i % 3 == 0 || i % 5 == 0 }.inject(:+) || 0
end

def solution(number)
  num3 = (number-1)/3
  num5 = (number-1)/5
  num15 = (number-1)/15
  (3+3*num3)*num3/2+(5+5*num5)*num5/2-(15+15*num15)*num15/2
end

def solution(n)
1.upto(n-1).to_a.keep_if { |num| (num % 5 == 0) || (num % 3 == 0) }.reduce(:+)
end

def solution(number)
  ans = 0
  (3...number).step(3) {|n| ans += n}
  (5...number).step(5) {|n| n % 3 == 0 ? next : ans += n}
  return ans
end

def solution(number)
  candidates = ->(k) { (k % 3) * (k % 5) == 0 }
  (1...number).select(&candidates).reduce(0, &:+)
end

def solution(number)
  sum = 0
  number % 3 == 0 ? mults = number/3 - 1 : mults = number/3
  mult = 1
  
  mults.times do
    sum += 3 * mult
    mult += 1
  end
  
  number % 5 == 0 ? mults = number/5 - 1 : mults = number/5
  mult = 1
  mults.times do
    sum += 5 * mult if 5 * mult % 15 != 0
    mult += 1
  end
  
  sum
end

def solution(number)
  sumX(3, number) + sumX(5, number) - sumX(15, number)
end

def sumX(x, number)
  n = (number - 1) / x
  x * n * (n + 1) / 2
end

p solution(10) # 23

# require "benchmark"

# n = 1_000_000
# Benchmark.bm do |x|
#   x.report { n.times { solution(10) } }
# end