# Don't give me five!

# In this kata you get the start number and the end number of a region and
# should return the count of all numbers except numbers with a 5 in it. 
# The start and the end number are both inclusive!

# Examples:

# 1,9 -> 1,2,3,4,6,7,8,9 -> Result 8
# 4,17 -> 4,6,7,8,9,10,11,12,13,14,16,17 -> Result 12
# The result may contain fives. ;-)
# The start number will always be smaller than the end number. Both numbers 
# can be also negative!

# I'm very curious for your solutions and the way you solve it. Maybe someone 
# of you will find an easy pure mathematics solution.

# Have fun coding it and please don't forget to vote and rank this kata! :-)

# I have also created other katas. Take a look if you enjoyed this kata!

# MY SOLUTION
def dont_give_me_five(small, big)
  (small..big).map(&:to_s)
              .grep_v(/5/)
              .size
end

# OTHER SOLUTIONS
def dont_give_me_five(start_,end_)
  (start_..end_)
    .reject { |e| e.to_s.include?('5') }
    .count
end

def dont_give_me_five(start,end_)
    (start..end_).count { | i | not i.to_s.include? '5' }
end

def dont_give_me_five(start_,end_)
  (start_..end_).count { |n| n.to_s !~ /5/ }
end

def dont_give_me_five(small, big)
  (small..big).reject { |n| n.to_s =~ /5/ }.size
end

def dont_give_me_five(start_,end_)
    (start_..end_).count{ |num| !num.to_s.chars.include?('5') }
end

p dont_give_me_five(1,9)#, 8)
p dont_give_me_five(4,17)#, 12)