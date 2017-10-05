# Write a function that takes an array and counts
#  the number of each unique element present.

# count(['james', 'james', 'john']) 
# #=> { 'james' => 2, 'john' => 1}

# MY SOLUTION
def count(array)
  array.each_with_object(Hash.new(0)) { |item, obj| obj[item] += 1}
end

# OTHER SOLUTIONS
def count(array)
  c = Hash.new(0)
  array.each { |i| c[i] += 1  }
  c
end

def count(array)
  array.reduce(Hash.new(0)) { |a, b| a[b] += 1; a }
end

def count(array)
  Hash[array.map{ |x| [x, array.count(x)] }.uniq]
end

def count(array)
  array.uniq.map{|i| [i, array.count(i)]}.to_h
end

p count(['a', 'a', 'b', 'b', 'b'])#, { 'a' => 2, 'b' => 3 })
