# Implement a function that adds two numbers together
# and returns their sum in binary. The conversion can be done before, or after the addition.

# The binary number returned should be a string.

# MY SOLUTION
def add_binary(a,b)
  "%b" % (a + b)
end

# BEST SOLUTIONS
def add_binary(a,b)
  (a + b).to_s(2)
end

p add_binary(1,1)#"10")
p add_binary(0,1)#"1")
p add_binary(1,0)#"1")
p add_binary(2,2)#"100")
p add_binary(51,12)#"111111")