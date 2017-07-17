# When given a string of space separated words, return the word with the 
# longest length. If there are multiple words with the longest length, 
# return the last instance of the word with the longest length.

# Example:

# 'red white blue' //returns string value of white

# 'red blue gold' //returns gold

# MY SOLUTION
def longest_word(string_of_words)
  string_of_words.split.sort_by!(&:size).last
end



    p longest_word('a b c d each') # , "each" )
    p longest_word('each step') # , "step" )
    p longest_word('forward each step going') # , "forward" )
    p longest_word('brings each step going') # , "brings" )
    p longest_word('brings each opportunity step going') # , "opportunity" )
