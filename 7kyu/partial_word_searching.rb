# Write a method that will search an array of strings for all strings that 
# contain another string, ignoring capitalization. Then return an array of the found strings.

# The method takes two parameters, the query string and the array of strings
# to search, and returns an array.

# If the string isn't contained in any of the strings in the array, the
# method returns an array containing a single string: "Empty" (or Nothing
# in Haskell, or "None" in Python)

# Examples

# If the string to search for is "me", and the array to search is 
# ["home", "milk", "Mercury", "fish"], the method should return ["home", "Mercury"].

# MY SOLUTION
def findWord(query, array_of_strings)
  endarray = []
  # array_of_strings.select { |str| str.match(Regexp.new(query, true)) }
  endarray = array_of_strings.select { |str| str =~ Regexp.new(query, true) }
  endarray.empty? ? ["Empty"] : endarray
end

# BEST SOLUTION
def findWord(query, array)
   a = array.grep(/#{query}/i)
   a.empty? ? ["Empty"] : a
end

a = ["elf", "bog creature", "bee ","milk","FROGS"]
p findWord("og", a) # == "bog creature", 'Incorrect.')
p findWord("og", a) # == "FROGS", 'Incorrect.')
p findWord("MIL", a) # == "milk", 'Incorrect.')
p findWord(" ", a) # == "bog creature", 'Incorrect.')
p findWord(" ", a) # == "bee ", 'Incorrect.')
p findWord("26", a) # == "Empty", 'Incorrect.')

