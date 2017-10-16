# Complete the solution so that it reverses the string value passed into it.

# solution('world') # returns 'dlrow'

# MY SOLUTION
def solution(str)
  str.reverse
end

def solution(str)
  str_array = str.split("")
  i = 0
  j = str.length - 1
  (str.length/2).floor.times do
    str_array[i], str_array[j] = str_array[j], str_array[i]
    i += 1
    j -= 1
  end
  str_array.join("")
end

def solution(str)
  str.split('').inject('') { |s, b| b + s }
end

def solution(str=nil)
   str.reverse if !str.nil?
end

def solution(str)
  return str if str.empty?
  str[-1] + solution(str[0...-1])
end

p solution("home")