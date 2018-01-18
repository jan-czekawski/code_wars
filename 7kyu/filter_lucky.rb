# Write a function filterLucky/filter_lucky() that accepts a list 
# of integers and filters the list to only include the elements that contain the digit 7.

# For example,

# ghci> filterLucky [1,2,3,4,5,6,7,68,69,70,15,17]
# [7,70,17]
# Don't worry about bad input, you will always receive a finite 
# list of integers.

# MY SOLUTION
def filter_lucky(lst)
  # lst.select { |num| num.to_s =~ /7/ }
  lst.select { |num| "#{num}" =~ /7/ }
end

# CLEVER SOLUTIONS
def filter_lucky(lst)
  lst.select{|n|n.to_s.include?('7')}
end

def filter_lucky(lst)
  lst.select {|l| l if l.to_s.split("").include? "7"}
end

def filter_lucky(lst)
  lst.select { |elem| elem.to_s.index('7') }
end

    p filter_lucky([7]) # [7], "Expected [7]")
    p filter_lucky([77,8]) # [77], "Expected [77]")
    p filter_lucky([71]) # [71], "Expected [71]")
    p filter_lucky([71,9907,69]) # [71,9907], "Expected [71,9907]")