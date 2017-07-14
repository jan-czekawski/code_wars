# You are given a string of numbers between 0-9. Find the average of these
# numbers and return it as a floored whole number (ie: no decimal places)
# written out as a string. Eg:

# "zero nine five two" -> "four"

# If the string is empty or includes a number greater than 9, return "n/a"

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