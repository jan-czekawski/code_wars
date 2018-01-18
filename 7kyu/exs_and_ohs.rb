# Check to see if a string has the same amount of 'x's and 'o's.
# The method must return a boolean and be case insensitive. 
# The string can contains any char.

# Examples input/output:

# XO("ooxx") => true
# XO("xooxx") => false
# XO("ooxXm") => true
# XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
# XO("zzoo") => false

# MY SOLUTION
def XO(str)
  str.count("Oo") == str.count("Xx")
end

# BEST SOLUTIONS
def XO(str)
  str.downcase!
  str.count('o') == str.count('x')
end

def XO(str)
  str.downcase.count('x') == str.downcase.count('o')
end

def XO(str)
  balance = 0
  str.downcase.each_char do |c|
    case c
      when "x" then balance += 1
      when "o" then balance -= 1
    end
  end
  balance == 0
end

def XO(str)
  counts = {'x' => 0, 'o' => 0}
  str.each_char { |c| counts[c.downcase] +=1 if counts[c.downcase] }
  counts['x'] == counts['o']
end



p XO('xo') #true)
p XO('XO') #true)
p XO('xo0') #true)
p XO('xxxoo') #false)
p XO("xxOo") #true)

# require "benchmark"

# n = 1_000_000
# Benchmark.bm do |x|

#   x.report { n.times { XO ('xXxoOo')} }
# end