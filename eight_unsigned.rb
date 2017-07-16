# Implement String#eight_bit_number?#, which should return true if given
# object is a number representable by 8 bit unsigned integer (0-255), false otherwise.

# It should only accept numbers in canonical representation, 
# so no leading +, extra 0s, spaces etc.



# MY SOLUTION
class String
  def eight_bit_number?
    ("0".."255").to_a.include?(self)
  end
end

# BEST SOLUTIONS
class String
  def eight_bit_number?
    /\A(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\z/ === self
  end
end

class String
  def eight_bit_number?
    ('0'..'255') === self
  end
end

class String
  def eight_bit_number?
    to_i.to_s == self && to_i >= 0 && to_i <= 255
  end
end


p "".eight_bit_number?#, false
p "0".eight_bit_number?#, true
p "00".eight_bit_number?#, false
p "55".eight_bit_number?#, true
p "042".eight_bit_number?#, false
p "123".eight_bit_number?#, true
p "255".eight_bit_number?#, true
p "256".eight_bit_number?#, false
p "999".eight_bit_number?#, false
