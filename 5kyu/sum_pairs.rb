# Sum of Pairs

# Given a list of integers and a single sum value,
# return the first two values (parse from the left please) 
# in order of appearance that add up to form the sum.

# sum_pairs([11, 3, 7, 5],         10)
# #              ^--^      3 + 7 = 10
# == [3, 7]

# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * entire pair is earlier, and therefore is the correct answer
# == [4, 2]

# sum_pairs([0, 0, -2, 3], 2)
# #  there are no pairs of values that can be added to produce 2.
# == None/nil/undefined (Based on the language)

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *
# #  * entire pair is earlier, and therefore is the correct answer
# == [3, 7]
# Negative numbers and duplicate numbers can and will appear.

# NOTE: There will also be lists tested of lengths upwards of 
# 10,000,000 elements. Be sure your code doesn't time out.

def sum_pairs(ints, s)
  int_hash = Hash.new
  ints.each_with_index do |int, ix|
    ints[ix+1..-1].each_with_index do |int_2, ix_2|
      int_hash[[int, int_2]] = ix + ix_2 + 1 if (int + int_2) == s
      unless int_hash.empty?
        break if int_hash.values[0] < ix_2 + 1
      end
    end
  end
  int_hash.min[0]
  rescue
    nil
end

# BEST SOLUTIONS
def sum_pairs(ints, s)
  seen = Hash.new
  ints.each do |i|
    p seen
    return [s-i, i] if seen[s-i]
    seen[i] = true
  end
  nil
end

def sum_pairs(ints, s)
  seen = {}
  for i in ints do
    return [s-i, i] if seen[s-i]
    seen[i] = true
  end
  nil
end

def sum_pairs(ints, s)
  ints.combination(2)
      .find { |pair| pair[0] + pair[1] == s }
end

require 'set'
def sum_pairs(ints, s)
  seen = Set.new
  ints.each { |v|
    return [s - v, v] if seen.include?(s - v)
    seen << v
  }
  nil
end

def sum_pairs(arr, target)
  memo  = arr.each_index.group_by { |i| arr[i] }
  pairs = find_pair_indexes(memo, target)
  earliest_pair(pairs).map {|i| arr[i]} unless pairs.empty?
end

def find_pair_indexes(memo,target)
  memo.keys.each.with_object([]) do |k,pairs|
    index      = memo.fetch(k).shift
    pair_index = memo.fetch(target - k,[]).shift
    pairs.push([index, pair_index]) unless pair_index.nil?
  end
end

def earliest_pair(pairs)
  pairs.min_by { |p| p[1] }
end




def sum_pairs(ints, s)
  result = []
  new_ints = []

  ints_hash = Hash.new {|value,key| value[key]=0}
  ints.each do |x|
    ints_hash[x] += 1
    if ints_hash[x] < 3
      new_ints << x
    end
  end

  new_ints.each_with_index do |x,i|
    (i+1).upto(new_ints.length-1) do |a|
      if x + new_ints[a] == s
        result << [x, new_ints[a]]
      end
    end
  end
  result != [] ? result.sort[0] : nil
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 22, 33, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) #= [1, 7], "Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8")
p sum_pairs(l2, -6) #= [0, -6], "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6")
p sum_pairs(l3, -7) #= nil, "No Match: ["+l3.join(", ")+"] should return nil for sum = -7")
p sum_pairs(l4, 2) #= [1, 1], "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 ")
p sum_pairs(l5, 10) #= [3, 7], "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 ")
p sum_pairs(l6, 8) #= [4, 4], "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8")
p sum_pairs(l7, 0) #= [0, 0], "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0")
p sum_pairs(l8, 10) #= [13, -3], "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10")

# require "benchmark"
# n = 1
# arr= [5, 9, 13] * 10_000_000 << -3

# Benchmark.bm do |x|
#   x.report { n.times {sum_pairs(arr, 10)} }
# end