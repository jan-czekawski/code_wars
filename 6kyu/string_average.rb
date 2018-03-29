# You are given a string of numbers between 0-9. Find the average of these
# numbers and return it as a floored whole number (ie: no decimal places)
# written out as a string. Eg:

# "zero nine five two" -> "four"

# If the string is empty or includes a number greater than 9, return "n/a"

# MY SOLUTION
NUM = ["zero", "one", "two", "three", "four",
       "five", "six", "seven", "eight", "nine"]

def average_string(s)
  return "n/a" if s.empty?
  res = s.split.map do |str|
          return "n/a" unless NUM.include?(str)
          str
        end.inject(0) do |sum, num|
          sum + NUM.index(num)
        end
  # res > 0 ? NUM[res / s.split.size] : NUM[res]
  NUM[res / (res > 0 ? s.split.size : 1)]
end

# BEST SOLUTIONS
def average_string(s)
  map = %w(zero one two three four five six seven eight nine)
  numbers = s.split
  return 'n/a' unless numbers.any? && numbers.all? { |n| map.include? n }
  map[numbers.reduce(0) { |a, n| a += map.index(n) } / numbers.size]
end

def average_string(s)
  nums = 'zero one two three four five six seven eight nine'.split
  return 'n/a' if s.empty?
  s.split.each{|i| return 'n/a' unless nums.member?(i)}
  arr = s.split.map{|i| nums.index(i)}
  nums[arr.reduce(:+)/arr.size]
end

def average_string(s)
  n = ["zero","one","two","three","four","five","six","seven","eight","nine"]
  r = s.split(" ").reduce(s.size==0 ? -999 : 0) do 
    |a,b| a+(n.index(b)||-999)
  end / [s.split(" ").size,1].max; r>=0 ? n[r] : "n/a"
end

p average_string("zero nine five two") # "four")
p average_string("four six two three") # "three")
p average_string("one two three four five") # "three")
p average_string("five four") # "four")
p average_string("zero zero zero zero zero") # "zero")
p average_string("one one eight one") # "two")
p average_string("one") # "one")
p average_string("") # "n/a")
p average_string("ten") # "n/a")
p average_string("pippi") # "n/a")