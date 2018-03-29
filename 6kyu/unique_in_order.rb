# Implement the function unique_in_order which takes as argument a sequence and
# returns a list of items without any elements with the same value next to each
# other and preserving the original order of elements.

# For example:

# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

# MY SOLUTION
def unique_in_order(iterable)
  arr = []
  
  0.upto(iterable.size - 1) do |x|
    arr << iterable[x]
  end
  
  final_arr = []
  0.upto(arr.size - 1) do |y|
    final_arr << arr[y] if arr[y] != arr[y + 1]
  end
  
  final_arr
end


# BEST SOLUTIONS

def unique_in_order(iterable)
  iterable_arr = []
  
  iterable.length.times do |x|
  iterable_arr << iterable[x] if iterable[x] != iterable[x + 1]
  end
  
  iterable_arr
end

def unique_in_order(iterable)
  # (iterable.is_a?(String) ? iterable.chars : iterable).chunk { |x| x }.map(&:first)
  (iterable.is_a?(String) ? iterable.chars : iterable).chunk(&:itself).map(&:first)
end

# p unique_in_order('AAAABBBCCDAABBB')
# p unique_in_order('ABBCcAD') 
# p unique_in_order([1,2,2,3,3])