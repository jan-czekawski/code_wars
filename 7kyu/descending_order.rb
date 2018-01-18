# Your task is to make a function that can take any non-negative 
# integer as a argument and return it with it's digits in
# descending order. Essentially, rearrange the digits to
# create the highest possible number.

# Examples:

# Input: 21445 Output: 54421

# Input: 145263 Output: 654321

# Input: 1254859723 Output: 9875543221

# MY SOLUTION
def descending_order(n)
  # n.to_s.chars.sort { |a, b| b <=> a }.join.to_i
  n.to_s
   .chars
   .sort { |a, b| b <=> a }
   .join
   .to_i
end

# BEST SOLUTIONS
def descending_order(n)
  n.to_s.bytes.sort!.reverse!.pack("c*").to_i
end

def descending_order(n)
  n.to_s.chars.sort!.reverse!.join.to_i
end

p descending_order(1234) # 0)
p descending_order(1) # 1)
p descending_order(123456789) # 987654321)