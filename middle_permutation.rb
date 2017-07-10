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

# def middle_permutation(string)
#   combos = string.chars.sort.permutation(string.size).map(&:join)
#   combos.size.even? ? combos[combos.size / 2 - 1] : combos[combos.size / 2] 
# end

# def sort_arr(arr)
#   return arr if arr.size <= 1
#   middle = arr.pop
#   less = arr.select { |x| x < middle }
#   more = arr.select { |x| x >= middle }
#   sort_arr(less) + [middle] + sort_arr(more)
# end

# def middle_permutation(string)
#   new_sort = []
#   size = string.size
#   sort_combos = string.chars
#   sort_combos = sort_arr(sort_combos)
#   all_combos = sort_combos.permutation(string.size).map(&:join)
#   all_combos.size.even? ? all_combos[all_combos.size / 2 - 1] : all_combos[all_combos.size / 2]
# end

# def sort_arr(arr)
#   return arr if arr.size <= 1
#   middle = arr.pop
#   less = arr.select { |x| x < middle }
#   more = arr.select { |x| x >= middle }
#   sort_arr(less) + [middle] + sort_arr(more)
# end

# def perm(arr)
#   new_sort = []
#   arr.each_index do |idx|
#     new_arr = []
#     new_arr << arr[idx]
#     new_arr = new_arr
#     # unless arr[idx + 1].nil?
#     #   new_sort << arr[idx] + arr[(idx + 1)..(arr.size - 1)]
#     # end
#     new_sort << new_arr
#   end
#   p new_sort
# end

# def middle_permutation(string)
#   # new_sort = []
#   size = string.size
#   all_combos_size = (1..size).inject(:*)
#   perm_end = all_combos_size.even? ? all_combos_size / 2 - 1 : all_combos_size / 2
  
#   sort_combos = string.chars
#   sort_combos = sort_arr(sort_combos)

#   # perm(sort_combos)
#   # p all_combos = 
#   #   sort_combos.permutation(string.size) do |combo|
                                                          
#   #   end
#   all_combos = sort_combos.permutation(string.size).map(&:join)
#   all_combos[perm_end]
# end


# def middle_permutation(string)
#   size = string.size
#   all_combos_size = (1..size).inject(:*)
#   perm_end = all_combos_size.even? ? all_combos_size / 2 - 1 : all_combos_size / 2
  
#   sort_combos = string.chars.sort
#   sort_combos.permutation(size).with_index do |combo, idx|
#     return combo.join if idx == perm_end
#   end
# end

# def priv_perm(prefix, priv_str, arr = [])
#   size = priv_str.size
#   if size == 0
#     p arr
#     arr << prefix
#     p arr
#   else
#     size.times do |x|
#       priv_perm(prefix + priv_str[x], priv_str.slice(0...x) + priv_str.slice((x + 1)..size), arr)
#     end
#   end
#   arr
# end

# def perm(str)
#   priv_perm("", str)
# end

def middle_permutation(string)
  size = string.size
  all_combos_size = (1..size).inject(:*)
  perm_end = all_combos_size.even? ? all_combos_size / 2 - 1 : all_combos_size / 2
  
  sort_combos = string.chars.sort.join
  all_combos = priv_perm(sort_combos, perm_end)
  all_combos[perm_end]
end

def priv_perm(priv_str, end_str, prefix = "", arr = [])
  size = priv_str.size
  if size == 0
    arr << prefix
    return arr[end_str] unless arr[end_str].nil?
  else
    size.times do |x|
      priv_perm(priv_str.slice(0...x) + priv_str.slice((x + 1)..size), end_str, prefix + priv_str[x], arr)
    end
  end
  arr
end

# def perm(str)
#   priv_perm("", str)
# end

# p priv_perm("abcdx") #,"bac")
# p middle_permutation("abcde") #,"bac")
# p middle_permutation("abcd") #,"bdca")
# p middle_permutation("abcdx") #,"cbxda")
# p middle_permutation("abcdxg") #,"cxgdba")
# p middle_permutation("abcdefghijkl") #,"dczxgba")
# p middle_permrmutation("cdba") #,"bac")
# p middle_permutation("abcd") #,"bdca")
# p middle_permutation("abcdx") #,"cbxda")
# p middle_permutation("abcdxg") #,"cxgdba")

# p middle_permutation("abcdxgzabcdxgzabcdxgzabcdxgz") #,"dczxgba")

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


