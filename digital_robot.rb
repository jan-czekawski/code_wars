# In this kata, you must create a digital root function.

# A digital root is the recursive sum of all the digits in a
# number. Given n, take the sum of the digits of n. If that 
# value has two digits, continue reducing in this way until a 
# single-digit number is produced. This is only applicable to the natural numbers.

# Here's how it works (Ruby example given):

# digital_root(16)
# => 1 + 6
# => 7

# digital_root(942)
# => 9 + 4 + 2
# => 15 ...
# => 1 + 5
# => 6

# digital_root(132189)
# => 1 + 3 + 2 + 1 + 8 + 9
# => 24 ...
# => 2 + 4
# => 6

# digital_root(493193)
# => 4 + 9 + 3 + 1 + 9 + 3
# => 29 ...
# => 2 + 9
# => 11 ...
# => 1 + 1
# => 2

# MY SOLUTION
def digital_root(n)
  # if n.to_s.size > 1
  if n > 9
    sum = n.to_s
           .chars
           .map(&:to_i)
           .inject(:+)
           
    digital_root(sum)
  else
    n
  end
  # n.to_s.size == 1 ? n : digital_root(n.to_s.chars.map(&:to_i).inject(:+))
end

# BEST SOLUTIONS
def digital_root(n)
  n < 10 ? n : digital_root(n / 10 + n % 10)
end

def digital_root(n)
  n>0 ? 1 + ((n.to_i - 1) % 9) : 0
end

def digital_root(n)
  n < 1 ? 0 : (n - 1) % 9 + 1
end

p digital_root(16)#, 7 )
p digital_root(942)#, 6 )