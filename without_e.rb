# Is it possible to write a book without the letter 'e' ?

# Task

# Given String str, return:

# How much "e" does it contains (case-insensitive) - return number as String.
# If given String doesn't contain any "e", return: "There is no "e"."
# If given String is empty, return empty String.
# If given String is null/None/nil, return null/None/nil



def find_e(s)
  return s if s.nil? || s.empty?
  s.count("Ee") > 0 ? "#{s.count("Ee")}" : "There is no \"e\"."
end


p find_e("actual") # "There is no \"e\".")
p find_e("") # "")
p find_e("English") # "1")
p find_e("English exercise") # "4")
p find_e(nil) # nil)
