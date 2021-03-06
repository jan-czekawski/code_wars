# As a part of this Kata, you need to create a function that when provided with a
# triplet, returns the index of the numerical element that lies between the other
# two elements.

# The input to the function will be an array of three distinct numbers (Haskell:
# a tuple).

# For example:

# gimme([2, 3, 1]) => 0

# 2 is the number that fits between 1 and 3 and the index of 2 in the input array
# is 0.

# Another example (just to make sure it is clear):

# gimme([5, 10, 14]) => 1

# 10 is the number that fits between 5 and 14 and the index of 10 in the input
# array is 1.

# MY SOLUTION
def gimme(input_array)
  second = input_array.sort
  input_array.find_index(second[1])
end

# OTHER SOLUTIONS
def gimme(input)
  input.index(input.sort[1])
end

def gimme(input)
  median_value = input.sort.at(input.length/ 2)
  input.index(median_value)
end

def gimme(input_array)
  input_array.each do |item|
    return input_array.index(item) if item > input_array.min && item < input_array.max
  end
end

def gimme(a)
  a.index(a.sort[((a.length-1)/2)])
end



p gimme([2, 3, 1])#, 0, 'Finds the index of middle element')
p gimme([5, 10, 14])#, 1, 'Finds the index of middle element')
p gimme([1, 3, 4])#, 1, 'Finds the index of middle element')
p gimme([15, 10, 14])#, 2, 'Finds the index of middle element')
p gimme([-0.410, -23, 4])#, 0, 'Finds the index of middle element(Negative numbers)')
p gimme([-15, -10, 14])#, 1, 'Finds the index of middle element (Negative numbers)')śś