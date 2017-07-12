# Description:

# Remove all exclamation marks from sentence but 
# ensure a exclamation mark at the end of string. For a 
# beginner kata, you can assume that the input data is always
# a non empty string, no need to verify it.

# Examples

# MY SOLUTION
def remove(s)
  s.gsub(/!/, '').concat("!")
end

# BEST SOLUTION
def remove(s)
  s.delete('!') << '!'
end

def remove(s)
  "#{s.gsub('!', '')}!"
end

p remove("Hi!") # === "Hi!"
p remove("Hi!!!") # === "Hi!"
p remove("!Hi") # === "Hi!"
p remove("!Hi!")  #=== "Hi!"
p remove("Hi! Hi!") # === "Hi Hi!"
p remove("Hi") #=== "Hi!"