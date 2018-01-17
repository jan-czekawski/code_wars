# You are given an array strarr of strings and an integer k.
# Your task is to return the first longest string consisting 
# of k consecutive strings taken in the array.

# #Example: longest_consec(["zone", "abigail", "theta", "form", 
# "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n 
# or k <= 0 return "".

# MY SOLUTION
def longest_consec(strarr, k)
  n = strarr.size
  return "" if k <= 0 || n == 0 || k > n
  
  long = Array.new
  
  strarr.each_index do |idx|
    long << strarr[idx, k].join
  end
  
  long.max_by(&:size)
end

# BEST SOLUTION
def longest_consec(strarr, k)
  return "" unless k.between?(1, strarr.length)
  strarr.each_cons(k).map(&:join).max_by(&:length) || ""
end

def longest_consec(strarr, k)
  return "" if (strarr.length == 0) or (k > strarr.length) or (k <= 0)
  
  longest = ""
  strarr.each_with_index do |i, index|
    candidate = "#{strarr[index..index+k-1].join('')}"
    if longest.length < candidate.length
      longest = candidate
    end
  end
  longest
end



p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2)# "abigailtheta")
p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1)# "oocccffuucccjjjkkkjyyyeehh")
p longest_consec([], 3)# "")
p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2)# "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck")
p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2)# "wlwsasphmxxowiaxujylentrklctozmymu")
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2)# "")
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3)# "ixoyx3452zzzzzzzzzzzz")
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15)# "")
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0)# "")


# require "benchmark"

# n = 100000

# Benchmark.bm do |x|
#   x.report { n.times { longest_consec1(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck","itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 10) } }
#   x.report { n.times { longest_consec2(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck","itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck", "itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 10) } }
# end
