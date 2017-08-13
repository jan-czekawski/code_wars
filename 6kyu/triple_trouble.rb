# Write a function
# which takes in numbers num1 and num2 and returns 1 if there is a 
# straight triple of a number at any place in num1 and also a straight double
# of the same number in num2.
# For example:
# If this isn't the case, return 0

def triple_double(num1,num2)
  numbers = num1.to_s.scan(/(\d)\1\1/)
  return 0 if numbers.empty?
  numbers.flatten!.map! { |i| num2.to_s.scan(/#{i}{2}/) }
  numbers.flatten.empty? ? 0 : 1
end

p triple_double(451999277, 41177722899)# 1)
p triple_double(1222345, 12345)# 0)
p triple_double(12345, 12345)# 0)
p triple_double(666789, 12345667)# 1)
p triple_double(10560002, 100)# 1)
p triple_double(10560009992, 100)# 1)