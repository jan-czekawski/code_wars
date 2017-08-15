# Complete the solution so that it splits the string into pairs 
# of two characters. If the string contains an odd number of 
# characters then it should replace the missing second character
# of the final pair with an underscore ('_').

# Examples:

# solution('abc') # should return ['ab', 'c_']
# solution('abcdef') # should return ['ab', 'cd', 'ef']

# MY SOLUTIONS
def solution(str)
  str << "_" if str.size.odd?
  str.scan(/\w\w/)
end

def solution(str)
  result = []
  str.scan(/(\w\w|\w\z)/) do |double|
    double[0] += "_" if double.first.size.odd?
    result << double
  end
  result.flatten
end

# BEST SOLUTIONS
def solution str
  (str + '_').scan /../
end

def solution(str)
    str << "_" if str.length % 2 != 0
    str.chars.each_slice(2).map(&:join)
end


p solution("abc")
p solution("abcdef")
p solution("abcd ef")