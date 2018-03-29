# Is it possible to write a book without the letter 'e' ?

# Task

# Given String str, return:

# How much "e" does it contains (case-insensitive) - return number as String.
# If given String doesn't contain any "e", return: "There is no "e"."
# If given String is empty, return empty String.
# If given String is null/None/nil, return null/None/nil


# MY SOLUTION
def find_e(s)
  return s if s.nil? || s.empty?
  s.count("Ee") > 0 ? "#{s.count("Ee")}" : "There is no \"e\"."
end

# BEST SOLUTIONS
def find_e(s)
  return s unless s&.size&. > 0
  s.count('Ee').zero? ? 'There is no "e".' : s.count('Ee').to_s
end

def find_e(s)
  return nil if s.nil?
  return s if s.length.zero?
  
  matches = s.scan(/e/i).length;
  matches > 0 ? matches.to_s : 'There is no "e".'
end

def find_e(s)
  #your code here 
  find_e = s.split('').select {|x| x == 'e' || x == 'E'}.length rescue nil
   
  if s == nil
    return nil
  elsif s == ""
    "#{s}"
  elsif find_e == 0
    "There is no \"e\"."
  else 
    "#{find_e}"
  end
end

def find_e(s)
  return nil if s.nil?
  return '' if s.empty?
  sum = s.chars.inject(0){ |sum, c| c =~ /[Ee]/ ? sum + 1 : sum }
  sum == 0 ? "There is no \"e\"." : sum.to_s
end

p find_e("actual") # "There is no \"e\".")
p find_e("") # "")
p find_e("English") # "1")
p find_e("English exercise") # "4")
p find_e(nil) # nil)
