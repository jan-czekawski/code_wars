# Create a function taking a positive integer as its parameter and 
# returning a string containing the Roman Numeral representation of that integer.

# Modern Roman numerals are written by expressing each digit separately
# starting with the left most digit and skipping any digit with a value
# of zero. In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC;
# resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses
# each Roman symbol in descending order: MDCLXVI.

# Example:

# solution(1000) # should return 'M'
# Help:

# Symbol    Value
# I          1
# V          5
# X          10
# L          50
# C          100
# D          500
# M          1,000
# Remember that there can't be more than 3 identical symbols in a row.

# More about roman numerals - http://en.wikipedia.org/wiki/Roman_numerals


# MY SOLUTIONS
def solution(number)
  result = ""
  roman_num = [[1000, "M"], [900, "CM"], [500, "D"], [400, "CD"],
               [100, "C"], [90, "XC"], [50, "L"], [40, "XL"],
               [10, "X"], [9, "IX"], [5, "V"], [4, "IV"], [1, "I"]]
  
  value_left = number
  value_to_str = nil
  
  roman_num.each do |num|
    if value_left >= num[0]
      value_to_str = value_left / num[0]
      value_left = value_left % num[0]
      result << num[1] * value_to_str
    end
  end
  
  result
end

def solution(num)
  result = ""
  
  roman_values = {
    M: 1000,
   CM: 900,
    D: 500,
   CD: 400,
    C: 100,
   XC: 90,
    L: 50,
   XL: 40,
    X: 10,
   IX: 9,
    V: 5,
   IV: 4,
    I: 1
  }

  roman_values.each do |k, v|
    if num / v > 0
      result += k.to_s * (num / v)
      num %= v
    end
  end  
  
  result
end

# BEST SOLUTIONS

NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
               L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

def solution(number)
  return '' if number <= 0
  NUMERALS.each { |key, val| return key.to_s + solution(number - val) if number >= val }
end


def solution(number)
  letters = %w[M CM D CD C XC L XL X IX V IV I]
  numbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  values = letters.zip(numbers)

  n=number
  c=0
  values.map{|l,v| c, n = n.divmod v; l*c}.join ''
end

def solution(decimal)
  data = {
    'M'   => 1000,
    'CM'  => 900,
    'D'   => 500,
    'C'   => 100,
    'XC'  => 90,
    'L'   => 50,
    'X'   => 10,
    'IX'  => 9,
    'V'   => 5,
    'IV'   => 4,
    'I'   => 1
  }

  data.inject('') do |roman, (letter, value)|
    while value <= decimal
      decimal -= value
      roman += letter
    end

    roman
  end
end

def solution(number)
  numerals = {
    1000 => "M",  
     900 => "CM",  
     500 => "D",  
     400 => "CD",
     100 => "C",  
      90 => "XC",  
      50 => "L",  
      40 => "XL",  
      10 => "X",  
       9 => "IX",  
       5 => "V",  
       4 => "IV",  
       1 => "I",  
  }
  
  ''.tap do |roman|
    numerals.each do |num, val|
      roman << val * (number / num)
      number %= num
    end
  end
end

p solution(1990) # MCMXC