# Write a function that takes an array and counts
#  the number of each unique element present.

# count(['james', 'james', 'john']) 
# #=> { 'james' => 2, 'john' => 1}



def count(array)
  array.each_with_object(Hash.new(0)) { |item, obj| obj[item] += 1}
end

p count(['a', 'a', 'b', 'b', 'b'])#, { 'a' => 2, 'b' => 3 })
