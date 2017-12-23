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

# BEST SOLUTIONS
def mxdiflg(a1, a2)
  # your code
  if a1.empty? || a2.empty?
    return -1
  end
  a1.product(a2).map {|x,y| (x.length - y.length).abs}.max
end

def mxdiflg(a1, a2)
  return -1 if a1.empty? || a2.empty?
  min1, max1 = a1.map(&:size).minmax
  min2, max2 = a2.map(&:size).minmax
  [max1 - min2, max2 - min1].max
end

def mxdiflg(a1, a2)  
  a1 = a1.map(&:size)
  a2 = a2.map(&:size)
  
  [a1.max - a2.min, a1.min - a2.max].map(&:abs).max rescue -1
end

def mxdiflg(a1, a2)
  a1.each.with_object([-1]) { |elem, ary|
    a2.each { |sec_elem| 
      ary << (elem.size - sec_elem.size).abs
    }
  }.max
end

def mxdiflg(a1, a2)
  mx = -1
  a1.each { |x|
    a2.each{ |y|
      diff = (x.length - y.length).abs
      if (diff > mx) then
        mx = diff
      end
    }
  }
  mx
end

def mxdiflg(a, b)
  an,ax = a.map(&:size).minmax
  bn,bx = b.map(&:size).minmax
  [bx-an,ax-bn].max
rescue
  -1
end

s1 = ["hoqq", "bbllkw", "oox", "ejjuyyy", "plmiis", "xxxzgpsssa", "xxwwkktt", "znnnnfqknaz", "qqquuhii", "dvvvwz"]
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
p mxdiflg(s1, s2)#, 13)

s1 = []
s2 = ["cccooommaaqqoxii", "gggqaffhhh", "tttoowwwmmww"]
p mxdiflg(s1, s2)#, 13)