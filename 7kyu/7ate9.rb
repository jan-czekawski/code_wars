# Write a function that removes every lone 9 that is inbetween 7s.

# seven_ate9('79712312') => '7712312'
# seven_ate9('79797') => '777'

# Input: String Output: String

# MY SOLUTION
def seven_ate9(str)
  str.gsub(/(?<=7)9(?=7)/, '')
end

# OTHER SOLUTIONS
def seven_ate9(str)
  str.gsub(/79(?=7)/, '7')
end

def seven_ate9(str)
  while str.include?("797")
    str.sub!("797", "77")
  end
  return str
end

def seven_ate9(str)
  2.times {str.gsub!('797','77')}
  str
end

def seven_ate9(str)
  str.gsub!('797', '77') while str.include?('797')
  str
end

def seven_ate9(str)
  res = ''
  numbers = str.split("")
  numbers.each_with_index do |number, index|
    if number == '9' && numbers[index -1] == '7' && numbers[index + 1] == '7'
      res += ''
    else
      res += number
    end
  end
  res
end

p seven_ate9('165561786121789797')#'16556178612178977')
p seven_ate9('797')#'77')
p seven_ate9('7979797')#'7777')