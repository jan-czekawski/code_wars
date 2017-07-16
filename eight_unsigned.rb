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




p "".eight_bit_number?#, false
p "0".eight_bit_number?#, true
p "00".eight_bit_number?#, false
p "55".eight_bit_number?#, true
p "042".eight_bit_number?#, false
p "123".eight_bit_number?#, true
p "255".eight_bit_number?#, true
p "256".eight_bit_number?#, false
p "999".eight_bit_number?#, false
