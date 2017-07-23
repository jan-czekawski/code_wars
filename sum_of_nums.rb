# Given two integers, which can be positive and negative, 
# find the sum of all the numbers between including them
# too and return it. If both numbers are equal return a or b.

# Note! a and b are not ordered!

# Example: 
# get_sum(1, 0) == 1   # 1 + 0 = 1
# get_sum(1, 2) == 3   # 1 + 2 = 3
# get_sum(0, 1) == 1   # 0 + 1 = 1
# get_sum(1, 1) == 1   # 1 Since both are same
# get_sum(-1, 0) == -1 # -1 + 0 = -1
# get_sum(-1, 2) == 2  # -1 + 0 + 1 + 2 = 2

# MY SOLUTION
def get_sum(a,b)
  a, b = [a, b].minmax
  [*a..b].inject(:+)
end

# BEST SOLUTION
def get_sum(a,b)
  Range.new(*[a, b].sort).reduce(:+)
end

def get_sum(a,b)
  (a + b) / 2.0 * ((a - b).abs + 1)
end

def get_sum(a, b)
  (a + b) * ((a - b).abs + 1) / 2
end

def get_sum(*args)
  (args.min..args.max).reduce(0, &:+)
end

p get_sum(0,1)#1)
p get_sum(0,-1)#-1)
p get_sum(1,2)#3)
p get_sum(5,-1)#14)