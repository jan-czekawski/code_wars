# You have a sequence of positive numbers starting with 1, but one number is 
# missing!

# Find out the missing number; if the sequence is not broken, you should return 0.
# Each sequence always increments by 1.

# In short: an invalid sequence (a string with non numeric character) must return
# 1, an already complete (or empty) sequence must return 0; a broken sequence
# with more than one number missing should return the lowest missing number; 
# otherwise return the missing number.

# Note that the input may be with random order.

# E.g.

# find_missing_number("1 3 2 5") # returns 4, because 4 is missing

# find_missing_number("1 2 3 4") # returns 0, because the sequence isn't broken

# find_missing_number("1 5") # returns 2, because the sequence is missing more
# than one number and 2 is the lowest between 2, 3 and 4

# find_missing_number("2 1 4 3 a") # returns 1, because it's an invalid sequence.
# in this case, it's invalid because contain a non numerical characte

def find_missing_number(seq)
  return 0 if seq.empty?
  arr = seq.split.each do |el| 
        unless el.to_i.to_s == el
          return 1
        end
      end.map(&:to_i).sort
  i = 1
  loop do
    if arr[i - 1] == i
      i += 1
    else
      break i
    end
    break 0 if i > arr.size
  end
end

# BEST SOLUTIONS
def find_missing_number(sequence)
  number_sequence = sequence.split.map(&:to_i).sort
  
  number_sequence.each.with_index(1) do |actual, expected|
    return expected unless actual == expected
  end
  
  0
end

def find_missing_number(sequence)
  sequence.split.map(&:to_i).sort.each.with_index(1) do |n, i|
    return i if n != i
  end
  0
end

def find_missing_number(sequence)
  return 0 if sequence.empty?
  arr = sequence.split.map(&:to_i).sort
  return 1 if arr.first != 1
  return 0 if arr.last-arr.first+1 == arr.length
  ((1..100).to_a - arr).first
end

def find_missing_number(sequence)
  return 0 if sequence.empty?
  
  arr = sequence.split(" ")
  arr.each_with_index {|x,i| arr[i] = x.to_i }
  arr.sort!
  return 1 if arr[0] != 1
  arr.each_with_index {|x,i| return i+1 unless x==(i+1) } 
  return 0
end
p find_missing_number("1 2 3 5")#4,"It must work for missing middle terms")
p find_missing_number("1 3")#2,"It must work for missing middle terms")
p find_missing_number("")# 0,"It must return 0 for an empty sequence")
p find_missing_number("2 3 4 5")#1,"It must return 1 for a sequence missing the first element")
p find_missing_number("2 1 4 3 a")#1,"It must return 1 for an invalid sequence")
p find_missing_number("2 1 4 3 5")#0,"It must return 1 for an invalid sequence")
