# Implement a method that accepts 3 integer values a, b, c.
# The method should return true if a triangle can be built with
# the sides of given length and false in any other case.

# (In this case, all triangles must have surface greater than 0 to be accepted).

# MY SOLUTION
def isTriangle(a,b,c)
  [a, b, c].sort.last < [a, b, c].sort.first(2).inject(:+)
end

# BEST SOLUTION
def isTriangle(*a)
  a.sort![0] + a[1] > a[2]
end

def isTriangle(a,b,c)
   a, b, c = [a, b, c].sort
   a + b > c
end

p isTriangle(1,2,2) #, true)
p isTriangle(7,2,2) #, false)