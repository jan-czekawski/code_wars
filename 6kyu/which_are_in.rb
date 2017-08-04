# Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

# #Example 1: a1 = ["arp", "live", "strong"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns ["arp", "live", "strong"]

# #Example 2: a1 = ["tarp", "mice", "bull"]

# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# returns []

# #Notes: Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

# Beware: r must be without duplicates.

# MY SOLUTION
def in_array(array1, array2)
  array1.select do |word| 
    array2.any? { |long_word| long_word.match(word)  }
  end.sort.uniq
end

# BEST SOLUTIONS
def in_array(array1, array2)
  array1.select{|s| array2.any?{|w| w.include?(s) } }.sort
end

def in_array(content, check)
 check = check.join(' ')
 content.select { |word| check.include? word }
        .sort
end

def in_array( needles, haystack)
  needles.select {|needle| in_haystack?(needle, haystack)}.sort
end

def in_haystack?( needle, haystack )
  haystack.any? {|hay| hay.include?(needle)}
end

def in_array(array1, array2)
  array1.select { |word| array2.join =~ /#{word}/ }.sort
end

def in_array(array1, array2)
  array2.map { |a2| array1.select { |a1| a2.include? a1 } }.flatten.uniq.sort
end

def in_array(array1, array2)
  array1.select { |a1| array2.index{ |a2| a2[a1] } }.uniq.sort 
end

require "set"

def in_array(array1, array2)
  ret  = SortedSet.new
  array2.each do |b|
    (array1-ret.to_a).each do |a|
      ret << a if b.include? a
    end
  end
  ret.to_a
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2)#, ["arp", "live", "strong"])
a1 = ["tarp", "mice", "bull"]
p in_array(a1, a2)#, [])