# The input is a string str of digits. Cut the string into chunks 
# (a chunk here is a substring of the initial string) of size sz
# (ignore the last chunk if its size is less than sz).

# If a chunk represents an integer such as the sum of the cubes of 
# its digits is divisible by 2, reverse that chunk; otherwise rotate 
# it to the left by one position. Put together these modified chunks 
# and return the result as a string.

# If

# sz is <= 0 or if str is empty return ""
# sz is greater (>) than the length of str it is impossible to take a 
# chunk of size sz hence return "".
# Examples:
# revrot("123456987654", 6) --> "234561876549"
# revrot("123456987653", 6) --> "234561356789"
# revrot("66443875", 4) --> "44668753"
# revrot("66443875", 8) --> "64438756"
# revrot("664438769", 8) --> "67834466"
# revrot("123456779", 8) --> "23456771"
# revrot("", 8) --> ""
# revrot("123456779", 0) --> "" 
# revrot("563000655734469485", 4) --> "0365065073456944"


def revrot(str, sz)
  return "" if str.empty? || sz <= 0 || sz > str.size
  temp_str = str.clone
  chunk = Array.new
  while temp_str.size >= sz
    chunk << temp_str.slice!(0, sz)
  end
  chunk.map do |num|
    sum = num.chars.inject(0) { |sum, num| sum + (num.to_i)**3 }
    if sum.even?
      num.reverse
    else
      num.chars.rotate.join
    end
  end.join
end


# p revrot("1234", 0)# "")
# p revrot("", 0)# "")
# p revrot("1234", 5)# "")
p revrot("733049910872815764", 5)# "330479108928157")
p revrot("123456987654", 6)#-> "234561876549"
# p revrot("123456987653", 6)#-> "234561356789"
p revrot("66443875", 4)#-> "44668753"
# p revrot("66443875", 8)#-> "64438756"
# p revrot("664438769", 8)#-> "67834466"
# p revrot("123456779", 8)#-> "23456771"
# p revrot("", 8)#-> ""
# p revrot("123456779", 0)#-> "" 
# p revrot("563000655734469485", 4)#-> "0365065073456944"