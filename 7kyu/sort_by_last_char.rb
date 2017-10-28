# Given a string of words (x), you need to return an array of the words, 
# sorted alphabetically by the final character in each.

# If two words have the same last letter, they returned array should show 
# them in the order they appeared in the given string.

# All inputs will be valid.

# MY SOLUTION
def last(x)
  x.split.sort { |a, b| a[-1] <=> b[-1] }
end


p last('man i need a taxi up to ubud')# ['a', 'need', 'ubud', 'i', 'taxi', 'man', 'to', 'up'])
p last('what time are we climbing up the volcano')# ['time', 'are', 'we', 'the', 'climbing', 'volcano', 'up', 'what']) 
p last('take me to semynak')# ['take', 'me', 'semynak', 'to'])
p last('massage yes massage yes massage')# ['massage', 'massage', 'massage', 'yes', 'yes'])
p last('take bintang and a dance please')# ['a', 'and', 'take', 'dance', 'please', 'bintang'])
