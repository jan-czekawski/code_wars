# #Find the missing letter

# Write a method that takes an array of consecutive (increasing) letters as 
# input and that returns the missing letter in the array.

# You will always get an valid array. And it will be always exactly one letter 
# be missing. The length of the array will always be at least 2.
# The array will always contain letters in only one case.

# Example:

# ['a','b','c','d','f'] -> 'e'
# ['O','Q','R','S'] -> 'P'
# (Use the English alphabet with 26 letters!)

# MY SOLUTION
def find_missing_letter(arr)
  arr.each_with_index { |ltr, i| return ltr.next unless ltr.next == arr[i + 1] }
end

# BEST SOLUTIONS
def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first
end

def find_missing_letter(arr)
  find_missing_letters(arr).first
end

def find_missing_letters(arr)
  [*arr.first..arr.last] - arr
end



p find_missing_letter(["a","b","c","d","f"]) #, "e") #
p find_missing_letter(["O","Q","R","S"]) #, "P") #
p find_missing_letter(["b","d"]) #, "c") #
p find_missing_letter(["a","b","d"]) #, "c") #
p find_missing_letter(["b","d","e"]) #, "c")