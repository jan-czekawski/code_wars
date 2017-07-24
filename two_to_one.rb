# Take 2 strings s1 and s2 including only letters 
# from ato z. Return a new sorted string, the 
# longest possible, containing distinct letters,

# each taken only once - coming from s1 or s2. 
#Examples: ``` a = "xyaabbbccccdefww" b = "xxxxyyyyabklmopq" longest(a, b) -> "abcdefklmopqwxy"
# a = "abcdefghijklmnopqrstuvwxyz" longest(a, a) -> "abcdefghijklmnopqrstuvwxyz" ```


def longest(a1, a2)
  # (a1 + a2).chars.uniq.sort.join
  (a1 + a2).chars
          .uniq
          .sort
          .join
end

def longest1(a1, a2)
  (a1.split('') | a2.split('')).sort * ''
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