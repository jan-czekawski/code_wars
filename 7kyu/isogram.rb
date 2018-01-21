# An isogram is a word that has no repeating letters, consecutive or 
# non-consecutive. Implement a function that determines whether a 
# string that contains only letters is an isogram. Assume the empty
# string is an isogram. Ignore letter case.

# is_isogram("Dermatoglyphics" ) == true
# is_isogram("aba" ) == false
# is_isogram("moOse" ) == false # -- ignore letter case

def is_isogram(string)
  string.chars
        .each_with_object(Hash.new(0)) { |lt, hs| hs[lt.downcase] += 1 }
        .all? { |k, v| v == 1 }
end

def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end

def is_isogram(string)
    # string.downcase.chars.uniq.size == string.downcase.chars.size
    string.downcase.chars.uniq.size == string.size
end



p is_isogram("Dermatoglyphics")#  true )
p is_isogram("isogram")#  true )
p is_isogram("aba")#  false, "same chars may not be adjacent" )
p is_isogram("moOse")#  false, "same chars may not be same case" )
p is_isogram("isIsogram")#  false )
p is_isogram("")#  true, "an empty string is a valid isogram" )

# require "benchmark"
# n = 100_000
# Benchmark.bm do |x|
#   x.report { n.times { is_isogram1("Dermatoglyphics") } }
#   x.report { n.times { is_isogram2("Dermatoglyphics") } }
#   x.report { n.times { is_isogram3("Dermatoglyphics") } }
# end