# The goal of this exercise is to convert a string 
# to a new string where each character in the new 
# string is '(' if that character appears only once 
# in the original string, or ')' if that character 
# appears more than once in the original string. Ignore capitalization
# when determining if a character is a duplicate.

# Examples:

# "din" => "((("

# "recede" => "()()()"

# "Success" => ")())())"

# "(( @" => "))(("

# MY SOLUTION
def duplicate_encode(word)
  word.downcase!
  word.chars
      .map { |let| let = word.count(let) > 1 ? ")" : "(" }
      .join 
end


p duplicate_encode("din")#"(((")
p duplicate_encode("recede")#"()()()")
p duplicate_encode("Success")#")())())","should ignore case")
p duplicate_encode("(( @")#"))((")