# Take 2 strings s1 and s2 including only letters 
# from ato z. Return a new sorted string, the 
# longest possible, containing distinct letters,

# each taken only once - coming from s1 or s2. 
#Examples: ``` a = "xyaabbbccccdefww" b = "xxxxyyyyabklmopq" longest(a, b) -> "abcdefklmopqwxy"
# a = "abcdefghijklmnopqrstuvwxyz" longest(a, a) -> "abcdefghijklmnopqrstuvwxyz" ```

# MY SOLUTION
def longest(a1, a2)
  # (a1 + a2).chars.uniq.sort.join
  (a1 + a2).chars
           .uniq
           .sort
           .join
end

# BEST SOLUTION
def longest(a1, a2)
  (a1.split('') | a2.split('')).sort * ''
end

def longest(a1, a2)
  str = a1 + a2
  str.split(//).sort.join('').squeeze
end

def longest(a1, a2)
  (a1+a2).split("").uniq.sort.join(",").tr(" ,\t\n", '')
end

def longest(a1, a2)
  str = Hash.new()

  for i in 0...a1.length
    str["#{a1[i]}"] = a1[i]
  end

  for i in 0...a2.length
    str["#{a2[i]}"] = a2[i]
  end
  
  fstr = ""
  str.each{ |key, value| fstr += value }
  
  fstr.chars.sort.join
  
end

def longest(a1, a2)
  a1.chars.concat(a2.chars).sort.chunk { |x| x }.map(&:first).join
end

def longest(a1, a2)
  (a1.scan(/\w/) + a2.scan(/\w/)).sort.uniq.join
end

p longest("aretheyhere", "yestheyarehere")# "aehrsty")
p longest("loopingisfunbutdangerous", "lessdangerousthancoding")# "abcdefghilnoprstu")
p longest("inmanylanguages", "theresapairoffunctions")# "acefghilmnoprstuy")


# require "benchmark"

# n = 100_000

# Benchmark.bm do |x|
#   x.report { n.times { longest("loopingisfunbutdangerous", "lessdangerousthancoding") } }
#   x.report { n.times { longest1("loopingisfunbutdangerous", "lessdangerousthancoding") } }
# end