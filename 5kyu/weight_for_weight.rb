# My friend John and I are members of the "Fat to Fit Club (FFC)". 
# John is worried because each month a list with the weights of 
# members is published and each month he is the last on the list
# which means he is the heaviest.

# I am the one who establishes the list so I told him: "Don't 
# worry any more, I will modify the order of the list". It was 
# decided to attribute a "weight" to numbers. The weight of a 
# number will be from now on the sum of its digits.

# For example 99 will have "weight" 18, 100 will have "weight" 1 
# so in the list 100 will come before 99. Given a string with the 
# weights of FFC members in normal order can you give this string
# ordered by "weights" of these numbers?

# Example:

# "56 65 74 100 99 68 86 180 90" ordered by numbers weights becomes: 
# "100 180 90 56 65 74 68 86 99"

# When two numbers have the same "weight", let us class them as if 
# they were strings and not numbers: 100 is before 180 because 
# its "weight" (1) is less than the one of 180 (9) and 180 is 
# before 90 since, having the same "weight" (9) it comes 
# before as a string.

# All numbers in the list are positive numbers and the 
# list can be empty.

# MY SOLUTION
def order_weight(strng)
  return "" if strng.empty?
  strng = strng.split.sort
  strng.sort_by { |num| num.split("").map(&:to_i).inject(:+) }
end

# def add_chars(num)
#   num.split("").map(&:to_i).inject(:+)
# end

# def order_weight(strng)
#   result = Array.new
#   strng = strng.split
  
#   smallest = strng.shift
#   strng.each do |str|
#     if str.add_chars == smallest.add_chars
#       if str < smallest
#       else
#       end
#     elsif str.add_chars < smallest.add_chars
#     else
#     end
#   end
# end

# BEST SOLUTIONS
def order_weight(string)
  string.split.sort_by { |n| [n.chars.map(&:to_i).reduce(:+), n] }.join(" ")
end

def compare a, b
  c = a.chars.reduce(0){ |s, x| s + x.to_i } <=> b.chars.reduce(0){ |s, x| s + x.to_i } 
  if c == 0 
    c = a <=> b
  end
  c
end

def order_weight(strng)
  weights = strng.split
  weights.sort{ |a, b| compare a, b }.join " "
end


def order_weight(strng)
    strng.split
         .map { |w| {w => w.chars.map(&:to_i).reduce(:+)} }
         .sort_by { |a| [a.values[0], a.keys] }
         .map { |w| w.keys[0] }
         .join ' '
end

def order_weight(strng)
  weights = strng.split(" ") #Convert string to array 
  digitsSum = weights.map{|x| x.chars.map(&:to_i).reduce(:+)} #Add the digits of each member
  indices = (0...weights.size()).to_a
  aHash = indices.zip(digitsSum).to_h #Make a hash with two arrays
  aHash = aHash.sort_by{|k,v| v}.to_h #Sort the hash by digit sum

  keys,values = aHash.keys, aHash.values 

  result = []
  max = weights.size()
  i = 0
  while i < max
    pack = []
    pack << weights[keys[i]] #The keys represent the order fake of the weights
    while i + 1 < max and values[i] == values[i + 1]
      pack << weights[keys[i+1]] #Accumulate weights with equal valor
      i += 1
    end
    pack = pack.sort #Sort equal weights by string
    result += pack
    i += 1
  end
  result.join(" ")
end

def order_weight(strng)
  strng.split.sort_by{|x| [x.sum - 48 * x.size, x] }*" "
end

# # lsmith-zenoscave # 10XL, c0nspiracy, g964
# def order_weight(strng)
#   lists = Array.new(180) {[]}
#   strng.split.each{|scr|lists[scr.sum-(?0.ord*scr.size)].push(scr)}
#   lists.map(&:sort).flatten*" "
# end

p order_weight("103 123 4444 99 2000")# "2000 103 123 4444 99")
p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123")# "11 11 2000 10003 22 123 1234000 44444444 9999")
p order_weight("2000 10003 1234000 90 180 44444444 9999 11 11 22 123")# "11 11 2000 10003 22 123 1234000 44444444 9999")