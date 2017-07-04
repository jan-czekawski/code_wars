# Your goal in this kata is to implement an difference function, which subtracts one list from another.

# It should remove all values from list a, which are present in list b.

# array_diff([1,2],[1]) == [2]
# If a value is present in b, all of its occurrences must be removed from the other:

# array_diff([1,2],[1]) == [2]

# MY SOLUTION
def array_diff(a, b)
  b.each { |b_element| a.delete(b_element) }
  a
end

# BEST SOLUTIONS
def array_diff(a, b)
  a - b
end

def array_diff(a, b)
  a.reject { |num| b.include?(num) }
  # a.concat(b).map { |x| x if (a.include?(x) && !b.include?(x)) ||
  # (!a.include?(x) && b.include?(x)) }.compact 
end

p array_diff([1, 2], [1])
p array_diff([1, 2, 2], [1])
p array_diff([1, 2, 2], [2])
p array_diff([1, 2, 2], [])
p array_diff([], [1, 2])