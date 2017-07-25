# The museum of incredible dull things

# The museum of incredible dull things wants to get rid of some 
# exhibitions. Miriam, the interior architect, comes up with a
# plan to remove the most boring exhibitions. She gives them a
# rating, and then removes the one with the lowest rating.

# However, just as she finished rating all exhibitions, she's off to an 
# important fair, so she asks you to write a program that tells her the
# ratings of the items after one removed the lowest one. Fair enough.

# Task

# Given an array of integers, remove the smallest value. Do not mutate 
# the original array/list. If there are multiple elements with the same
# value, remove the one with a lower index. If you get an empty 
# array/list, return an empty array/list.

# Don't change the order of the elements that are left.

# Examples

# remove_smallest([1,2,3,4,5]) = [2,3,4,5]
# remove_smallest([5,3,2,1,4]) = [5,3,2,4]
# remove_smallest([2,2,1,2,1]) = [2,2,2,1]

# MY SOLUTION
def remove_smallest(numbers)
  return numbers if numbers.empty?
  
  idx = numbers.find_index(numbers.min)
  # idx = numbers.index(numbers.min)
  numbers.delete_at(idx)
  
  numbers
end

# BEST SOLUTIONS
def remove_smallest(numbers)
  return [] if numbers.empty?
  numbers.delete_at(numbers.index(numbers.min))
  numbers
end

def remove_smallest(numbers)
  numbers.reject.with_index { |_,i| i == numbers.index(numbers.min) }
  # numbers.reject.with_index { |x,i| i == numbers.index(numbers.min) }
end

def remove_smallest(numbers)  
  numbers.delete_at(numbers.index(numbers.min) || 0)
  numbers
end

@numbers = []

def remove_smallest(numbers)
  @numbers = numbers
  @my_mutex = Mutex.new
  @min = 0
  (numbers.length-1).times.map do |i| Thread.new { sonic(i+1) } end.each(&:join)
  @numbers.delete_at(@min)
  return @numbers
end

def sonic(i)
  @my_mutex.synchronize do
    @min = @numbers[@min] >= @numbers[i] ? @numbers[@min] == @numbers[i] ? @min < i ? @min : i : i : @min
  end
end

p remove_smallest([1, 2, 3, 4, 5])# [2, 3, 4, 5], "Wrong result for [1, 2, 3, 4, 5]")
p remove_smallest([5, 3, 2, 1, 4])# [5, 3, 2, 4], "Wrong result for [5, 3, 2, 1, 4]")
p remove_smallest([2, 2, 1, 2, 1])# [2, 2, 2, 1], "Wrong result for [2, 2, 1, 2, 1]")
p remove_smallest([])# [], "Wrong result for []")