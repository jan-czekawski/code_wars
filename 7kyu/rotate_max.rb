# Take a number: 56789. Rotate left, you get 67895.

# Keep the first digit in place and rotate left the other digits: 68957.

# Keep the first two digits in place and rotate the other ones: 68579.

# Keep the first three digits and rotate left the rest: 68597. 
# Now it is over since keeping the first four it remains only one digit which rotated is itself.

# You have the following sequence of numbers:

# 56789 -> 67895 -> 68957 -> 68579 -> 68597

# and you must return the greatest: 68957.

# Calling this function max_rot (or maxRot or ... depending on the language)

# max_rot(56789) should return 68957

def max_rot(n)
  count = n.to_s.chars.count
  i = 0
  arr = []
  arr.push(n)
  
  until i == count - 1
    n = n.to_s.chars
    n = (n[0...i] + n[i..-1].rotate).join.to_i
    arr.push(n)
    i += 1
  end
  
  arr.max
end

p max_rot(56789)# should return 68957
p max_rot(38458215)# 85821534)
p max_rot(195881031)# 988103115)
p max_rot(896219342)# 962193428)
p max_rot(69418307)# 94183076)