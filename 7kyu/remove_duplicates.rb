# Remove Duplicates

# You are to write a function called unique that takes an array of 
# integers and returns the array with duplicates removed. It must return 
# the values in the same order as first seen in the given array. Thus no 
# sorting should be done, if 52 appears before 10 in the given array then
# it should also be that 52 appears before 10 in the returned array.

# Assumptions
# •All values given are integers (they can be positive or negative).
# •You are given an array but it may be empty.
# •They array may have duplicates or it may not.
# •You cannot use the uniq method on Arrays (don't even try it)# or the 
# nub function from Data.List.

# Example
# puts unique([1, 5, 2, 0, 2, -3, 1, 10]).inspect
# [1, 5, 2, 0, -3, 10]

# puts unique([]).inspect
# []

# puts unique([5, 2, 1, 3]).inspect
# [5, 2, 1, 3]

# MY SOLUTION
def unique(integers)
  integers.uniq
end

def unique(integers)
  new_integers = []
  integers.each do |item| 
    new_integers.push(item) unless new_integers.include?(item)
  end
  new_integers
end

p unique([])# [])
p unique([5, 2, 1, 3])# [5, 2, 1, 3])
p unique([1, 5, 2, 0, 2, -3, 1, 10])# [1, 5, 2, 0, -3, 10])
