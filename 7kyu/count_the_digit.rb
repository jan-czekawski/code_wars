# Take an integer n (n >= 0) and a digit d (0 <= d <= 9) as an integer. Square 
# all numbers k (0 <= k <= n) between 0 and n. Count the numbers of digits d used
# in the writing of all the k**2. Call nb_dig (or nbDig or ...) the function 
# taking n and d as parameters and returning this count.

# #Examples:

# n = 10, d = 1, the k*k are 0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100
# We are using the digit 1 in 1, 16, 81, 100. The total count is then 4.

# nb_dig(25, 1):
# the numbers of interest are
# 1, 4, 9, 10, 11, 12, 13, 14, 19, 21 which squared are 1, 16, 81, 100, 121, 
# 144, 169, 196, 361, 441
# so there are 11 digits `1` for the squares of numbers between 0 and 25.

# Note that 121 has twice the digit 1.

# MY SOLUTION
def nb_dig(n, d)
  (0..n).map { |i| (i**2).to_s }
        .join
        .count("#{d}")
end

def nb_dig(n, d)
  (0..n).map { |k| k ** 2 }.join.count d.to_s
end

# BEST SOLUTIONS
def nb_dig(n, d)
  (0..n).map{|x| (x**2).to_s.count(d.to_s)}.reduce(:+)
end

def nb_dig(n, d)
  (0..n).inject(0){|count, i| count + (i**2).to_s.count(d.to_s) }
end

def nb_dig(n, d)
  (0..n).map{|x| (x*x).to_s.count d.to_s}.inject{|s, x| s + x}
end

p nb_dig(10, 1)#, 4)
p nb_dig(5750, 0)#, 4700)
p nb_dig(11011, 2)#, 9481)
p nb_dig(12224, 8)#, 7733)
p nb_dig(11549, 1)#, 11905)