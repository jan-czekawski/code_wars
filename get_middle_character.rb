# You are going to be given a word. Your job is to return the middle
# character of the word. If the word's length is odd, return the middle
# character. If the word's length is even, return the middle 2 characters.

# #Examples:
# Kata.getMiddle("test") should return "es"
# Kata.getMiddle("testing") should return "t"
# Kata.getMiddle("middle") should return "dd"
# Kata.getMiddle("A") should return "A"

# #Input
# A word (string) of length 0 < str < 1000

# #Output
# The middle character(s) of the word represented as a string.

# MY SOLUTION
def get_middle(s)
  return s if s.size <= 1
  
  s.size.even? ? s.slice(s.size / 2 - 1, 2) : s.slice(s.size / 2)
end

# BEST SOLUTION
def get_middle(s)
  s[(s.size - 1)/2..s.size/2]
end

def get_middle(s)
  mid = s.size / 2
  s.size.even? ? s[mid-1..mid] : s[mid]
end

p get_middle("test"), get_middle("testing"), get_middle("middle"),
  get_middle("a"), get_middle("")