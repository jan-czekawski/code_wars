# Write a function that takes in a string of one or more words, and returns
# the same string, but with all five or more letter words reversed (Just
# like the name of this Kata). Strings passed in will consist of only letters
# and spaces. Spaces will be included only when more than one word is present.


# Examples:

# spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
# spinWords( "This is a test") => returns "This is a test" 
# spinWords( "This is another test" )=> returns "This is rehtona test"

# MY SOLUTION
# def spinWords(string)
#   string.split.map { |word| word.length >= 5 ? word.reverse : word }.join(" ")
# end

# BETTER SOLUTIONS
def spinWords(string)
  string.gsub(/\w{5,}/, &:reverse)
  # string.gsub(/\w{5,}/) { |x| x.reverse }
end

# def spinWords(string)
#   string.split.map { |word| word.length >= 5 && word.reverse || word }.join(" ")
# end

puts spinWords("Hey")
puts spinWords("Hey fellow warriors"), "Hey wollef sroirraw"
puts spinWords("This is a test"), "This is a test" 
puts spinWords("This is another test"), "This is rehtona test"