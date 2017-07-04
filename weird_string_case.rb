# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and
# returns the same string with all even indexed characters in each word upper
# cased, and all odd indexed characters in each word lower cased. The indexing
# just explained is zero based, so the zero-ith index is even, therefore that
# character should be upper cased.

# The passed in string will only consist of alphabetical characters and
# spaces(' '). Spaces will only be present if there are multiple words.
# Words will be separated by a single space(' ').

# Examples:

# weirdcase( "String" )#=> returns "StRiNg"
# weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

def weirdcase(string)
  i = 0
  string.gsub(/./) do |letter|
    if letter == " "
      i = 0
      letter
    elsif i.even?
      i += 1
      letter.upcase
    else
      i += 1
      letter.downcase
    end
  end
  # string.gsub(/./) do |letter|
  #   string.index(letter).even? ? letter.upcase : letter.downcase
  # end
end

# BEST SOLUTIONS
def weirdcase(string)
  string.gsub(/(\w{1,2})/) { $1.capitalize }
  # string.gsub(/(\w{1,2})/) { |s| $1.capitalize }
end

def weirdcase(string)
  string.split.map do |word|
    word.split("").each_with_index.map do |letter, i|
      i.even? ? letter.upcase : letter.downcase
    end.join
  end.join(" ")
end

p weirdcase("String"), weirdcase("Weird string case")