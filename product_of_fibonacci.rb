# The Fibonacci numbers are the numbers in the following integer sequence (Fn):

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...

# such as
# F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

# Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying
# F(n) * F(n+1) = prod.
# Your function productFib takes an integer (prod) and returns an array:

# [F(n), F(n+1), true] or {F(n), F(n+1), 1} or (F(n), F(n+1), True)
# depending on the language if F(n) * F(n+1) = prod.

# If you don't find two consecutive F(m) verifying F(m) * F(m+1) = prodyou will return

# [F(m), F(m+1), false] or {F(n), F(n+1), 0} or (F(n), F(n+1), False)
# F(m) being the smallest one such as F(m) * F(m+1) > prod.

# Examples

# productFib(714) # should return [21, 34, true], 
#                 # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

# productFib(800) # should return [34, 55, false], 
#                 # since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55
# Notes: Not useful here but we can tell how to choose the number n up to which 
# to go: we can use the "golden ratio" phi which is (1 + sqrt(5))/2 knowing 
# that F(n) is asymptotic to: phi^n / sqrt(5). That gives a possible upper bound to n.

# You can see examples in "Example test".

# References

# http://en.wikipedia.org/wiki/Fibonacci_number

# http://oeis.org/A000045


# def productFib(prod)
  # define array with first 2 elements
  fib_num = [0, 1]
  
  # fill remaining 98 elements of the fibbonacci numbers array
  2.upto(1000) do |x|
    fib_num[x] = fib_num[x - 1] + fib_num[x - 2]
  end
  
  # check array untill prod is equal to multiplification of 2 elements or till prod's lower than that result
  fib_num.length.times do |y|
    if fib_num[y] * fib_num[y + 1] == prod
      return [fib_num[y], fib_num[y + 1], true]
    elsif fib_num[y] * fib_num[y + 1] > prod
      return [fib_num[y], fib_num[y + 1], false] 
    end
  end
end

# BEST SOLUTIONS
def productFib(prod)
  a, b = [0, 1]
  while prod > a * b
    a, b = [b, a + b]
  end
  [a, b, a * b == prod]
end

def productFib(prod)
  a, b = [0, 1]
  while prod > a * b
    a, b = [b, [a, b].reduce(:+)]
  end
  [a, b, a * b == prod]
end

def productFib(prod)
  fib = [0, 1]
  until fib.last(2).reduce(:*) >= prod
  # until fib.last(2).inject(:*) >= prod
    fib << fib.last(2).reduce(:+)
  end
  fib.last(2) << (fib.last(2).reduce(:*) == prod)
end

p productFib(4895)
# [55, 89, true]
p productFib(5895)
# [89, 144, false])