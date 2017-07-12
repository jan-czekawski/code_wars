# Description:

# Remove all exclamation marks from sentence but 
# ensure a exclamation mark at the end of string. For a 
# beginner kata, you can assume that the input data is always
# a non empty string, no need to verify it.

# Examples

def remove(s)
  s.gsub(/!/, '').concat("!")
end

p remove("Hi!") # === "Hi!"
p remove("Hi!!!") # === "Hi!"
p remove("!Hi") # === "Hi!"
p remove("!Hi!")  #=== "Hi!"
p remove("Hi! Hi!") # === "Hi Hi!"
p remove("Hi") #=== "Hi!"