# In this kata you have to create all permutations of an input string and remove
# duplicates, if present. This means, you have to shuffle all letters from
# the input in all possible orders.

# Examples:

# permutations('a'); # ['a']
# permutations('ab'); # ['ab', 'ba']
# permutations('aabb'); # ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
# The order of the permutations doesn't matter.


# MY SOLUTION
def permutations(string)
  hash = Hash.new
  string.chars.permutation.to_a.map(&:join).map { |x| hash[x] = 1 }
  hash.map { |k, v| k} 
end

# BEST SOLUTION
def permutations(string)
  string.chars.permutation.to_a.map(&:join).uniq
end

def permutations(string)
  return [''] if string.empty?
    (0...string.size).flat_map do |i|
      char, rest = string[i], string[0...i] + string[i+1..-1]
    permutations(rest).map { |sub| char + sub }; end
  .uniq
end


p permutations('ab').sort #, ['ab', 'ba'])
p permutations('aabb').sort #, ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa'])