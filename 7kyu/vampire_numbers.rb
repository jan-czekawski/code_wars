# Vampire Numbers

# Our loose definition of Vampire Numbers can be described as follows:

# 6 * 21 = 126
# # 6 and 21 would be valid 'fangs' for a vampire number as the 
# # digits 6, 1, and 2 are present in both the product and multiplicands

# 10 * 11 = 110
# # 110 is not a vampire number since there are three 1's in the
# # multiplicands, but only two 1's in the product
# Create a function that can receive two 'fangs' and determine if the 
# product of the two is a valid vampire number.

# MY SOLUTION
def vampire_test(a,b)
  multiplicands_hash = Hash.new(0)
  product_hash = Hash.new(0)
  
  a.to_s.split('').each do |num|
  	multiplicands_hash[num] += 1
  end
  
  b.to_s.split('').each do |num|
  	multiplicands_hash[num] += 1
  end
  
  (a * b).to_s.split('').each do |num|
  	product_hash[num] += 1
  end

  multiplicands_hash == product_hash
end

# OTHER SOLUTIONS
def vampire_test(a,b)
  (a.to_s + b.to_s).chars.sort == (a * b).to_s.chars.sort
end

def vampire_test(a,b)
  "#{a}#{b}".chars.sort.join == (a*b).to_s.chars.sort.join
end

def vampire_test(a,b)
  product = (a * b).to_s.chars.sort
  fangs = "#{a}#{b}".chars.sort
  fangs == product
end

def vampire_test(a,b)
  ([] << a.to_s.split(//) << b.to_s.split(//)).flatten!.sort == (a * b).to_s.split(//).sort
end

p vampire_test(21,6)#, true, "Basic: 21 * 6 = 126 should return true")
p vampire_test(204,615)#, true, "Basic: 204 * 615 = 125460 should return true")
p vampire_test(30,-51)#, true, "One Negative: 30 * -51 = -1530 should return true")
p vampire_test(-246,-510)#, false, "Double Negatives: -246 * -510 = 125460 should return false (The negative signs aren't present on the product)")
p vampire_test(210,600)#, true, "Trailing Zeroes: 210 * 600 = 126000 should return true")
