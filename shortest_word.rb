# x Simple, given a string of words, return the length of the shortest word(s).

# String will never be empty and you do not need to account for different data types.

# MY SOLUTION
def find_short(s)
  # s.split.map(&:size).min
  s.split
   .map(&:size)
   .min
end

# CLEVER SOLUTION
def find_short(s)
    l = s.split.min_by(&:length).size
    return l
end

p find_short("bitcoin take over the world maybe who knows perhaps") # 3)
p find_short("turns out random test cases are easier than writing out basic ones") # 3)
p find_short("lets talk about javascript the best language") # 3)
p find_short("i want to travel the world writing code one day") # 1)
p find_short("Lets all go on holiday somewhere very cold") # 2)