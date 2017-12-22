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

# MY SOLUTION
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

# BEST SOLUTIONS
def max_rot(n)
  na = n.to_s.chars
  na.length.times.each_with_object([n]) do |i, arr|
    arr << (na << na.delete_at(i)).join.to_i
  end.max
end

def max_rot(n)
  a = n.to_s.chars
  rotates = (0...a.length).map { |i| 
    a = a[0,i] + a[i, a.length].rotate
    a.join.to_i
  } << n
  rotates.max
end

def max_rot(num)
  numbers = []
  array = num.to_s.split('').map! {|x|x.to_i}
  i = 0
  while i < num.to_s.length  
    array.insert(-1, array.delete_at(i))
    numbers << array.join('').to_i
    i+=1
  end
  numbers << num 
  numbers.uniq!.max  
end 

def max_rot(n)
    s, res, mx = n.to_s, "", n
    if (s.length == 1) then return n end
    while true do
        # left rotate s
        s = (s * 2)[1, s.length]
        # keep first char
        res += s[0]
        # new s
        s = s[1, s.length]
        nb = (res + s).to_i
        if (nb > mx) then mx = nb end
        if (s.length == 1) then break end
    end
    mx
end


p max_rot(56789)# should return 68957
p max_rot(38458215)# 85821534)
p max_rot(195881031)# 988103115)
p max_rot(896219342)# 962193428)
p max_rot(69418307)# 94183076)