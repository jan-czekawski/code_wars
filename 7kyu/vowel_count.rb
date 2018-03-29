# Return the number (count) of vowels in the given string.

# We will consider a, e, i, o, and u as vowels for this Kata.

# MY SOLUTION
def getCount(inputStr)
  inputStr.scan(/[aeiou]/i).size
end

# BEST SOLUTIONS
def getCount(inputStr)
  inputStr.count("aeiou")
end

def getCount(inputStr)
 inputStr.downcase.count('aeiou')
end


p getCount("abracadabra")