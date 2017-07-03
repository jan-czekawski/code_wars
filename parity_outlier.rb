# You are given an array (which will have a length of at least 3, but could be 
# very large) containing integers. The array is either entirely comprised of
# odd integers or entirely comprised of even integers except for a single
# integer N. Write a method that takes the array as an argument and returns N.

# For example:

# [2, 4, 0, 100, 4, 11, 2602, 36]

# Should return: 11

# [160, 3, 1719, 19, 11, 13, -21]

# Should return: 160

# MY SOLUTION
def find_outlier(integers)
  odd, even = [], []

  integers.each do |integer|
    if integer % 2 == 0
      even.push(integer)      
    else
      odd.push(integer)
    end
  end
  
  if even.size == 1
    even[0]
  else
    odd[0]
  end
end

# BEST SOLUTIONS
def find_outlier(integers)
  integers.partition(&:odd?).find(&:one?).first
end

def find_outlier(integers)
  outlier = integers.first(3).count(&:odd?) > 1 ? :even? : :odd?
  integers.find(&outlier)
end

# puts find_outlier([0, 1, 2])
# puts find_outlier([1, 2, 3])
# puts find_outlier([2, 6, 8, 10, 3])