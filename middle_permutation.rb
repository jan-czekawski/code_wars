# You are given a string s. Every letter in s appears once.

# Consider all strings formed by rearranging the letters in s. After ordering these strings in dictionary order, return the middle term. (If the sequence has a even length n, define its middle term to be the (n/2)th term.)

# Example

# For s = "abc", the result should be "bac".

# The permutations in order are:
# "abc", "acb", "bac", "bca", "cab", "cba"
# So, The middle term is "bac".
# Input/Output

# [input] string s

# unique letters (2 < length <= 26)
# [output] a string

# middle permutation.

require "benchmark"

def middle_permutation(string)
  combos = string.chars.sort.permutation(string.size).map(&:join)
  combos.size.even? ? combos[combos.size / 2 - 1] : combos[combos.size / 2] 
end

# def middle_permutation(string)
#   # combos = string.chars.sort.permutation(string.size).map(&:join)
#   leng = string.size
#   new_combos = []
#   combos = string.chars.sort
#   new_combos << combos[0] + combos[1] + combos[2] + combos[3]
#   new_combos << combos[0] + combos[1] + combos[3] + combos[2]
#   new_combos << combos[0] + combos[2] + combos[1] + combos[3]
#   new_combos << combos[0] + combos[2] + combos[3] + combos[1]
#   new_combos << combos[1] + combos[0] + combos[2] + combos[3]
#   new_combos << combos[1] + combos[0] + combos[3] + combos[2]
#   new_combos << combos[1] + combos[2] + combos[0] + combos[3]
#   new_combos << combos[1] + combos[2] + combos[3] + combos[0]
#   new_combos << combos[2] + combos[0] + combos[1] + combos[3]
#   new_combos << combos[2] + combos[0] + combos[3] + combos[1]
#   new_combos << combos[2] + combos[1] + combos[0] + combos[3]
#   new_combos << combos[2] + combos[1] + combos[3] + combos[0]
#   new_combos << combos[3] + combos[0] + combos[1] + combos[2]
#   new_combos << combos[3] + combos[0] + combos[2] + combos[1]
#   new_combos << combos[3] + combos[1] + combos[0] + combos[2]
#   new_combos << combos[3] + combos[1] + combos[2] + combos[0]
#   new_combos << combos[3] + combos[2] + combos[0] + combos[1]
#   new_combos << combos[3] + combos[2] + combos[1] + combos[0]
  
  
#   # combos.size.even? ? combos[combos.size / 2 - 1] : combos[combos.size / 2] 
# end

p middle_permutation("cdba") #,"bac")
p middle_permutation("abcd") #,"bdca")
p middle_permutation("abcdx") #,"cbxda")
p middle_permutation("abcdxg") #,"cxgdba")
p middle_permutation("abcdxgz") #,"dczxgba")
# p middle_permutation("abcdxgzabcdxgzabcdxgzabcdxgz") #,"dczxgba")
