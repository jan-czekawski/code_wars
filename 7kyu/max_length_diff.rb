# You are given two arrays a1 and a2 of strings. Each string is composed with
# letters from a to z. Let x be any string in the first array and y be any string
# in the second array.

# Find max(abs(length(x) − length(y)))

# If a1 and/or a2 are empty return -1 in each language except in Haskell 
# (F#) where you will return Nothing (None).

# #Example:

# s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
# s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
# mxdiflg(s1, s2) --> 13
# Bash note:

# input : 2 strings with substrings separated by ,

# output: number as a string

# MY SOLUTION
def mxdiflg(a1, a2)
	# your code
  return -1 if a1.empty? || a2.empty?
	a1_count, a2_count = [], []
	
	a1.each do |str| 
	  a1_count << str.chars.count
	end
	
	a2.each do |str| 
	  a2_count << str.chars.count
	end
	
	diff_1 = a1_count.max - a2_count.min
	diff_2 = a2_count.max - a1_count.min
  
  diff_1 > diff_2 ? diff_1 : diff_2
end

s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
p mxdiflg(s1, s2)#, 13)

s1 = []
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
p mxdiflg(s1, s2)#, 13)