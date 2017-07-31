# Count the number of Duplicates

# Write a function that will return the count of distinct 
# case-insensitive alphabetic characters and numeric digits 
# that occur more than once in the input string. The input 
# string can be assumed to contain only alphabets (both uppercase
# and lowercase) and numeric digits.

# Example

# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (bandB)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice

# MY SOLUTION
def duplicate_count1(text)
  letters = text.downcase.chars
  count = letters.each_with_object(Hash.new(0)) { |let, hash| hash[let] += 1 }
  count.select { |k, v| v > 1}.size
  
  # text.downcase
  #     .chars
  #     .each_with_object(Hash.new(0)) { |let, hash| hash[let] += 1 }
  #     .values
  #     .count { |v| v > 1 }
  
  # count = Hash.new(0)
  # text.downcase.chars.each { |let| count[let] += 1 }
  # count.values.count { |v| v > 1 }
end

# BEST SOLUTIONS
def duplicate_count(text)
  text.scan(/(\w) ( ?=  (?!.*\1.*\1 ).*\1 )/i).length
  # text.scan(/(\w)(?=(?!.*\1.*\1).*\1)/i)
end

def duplicate_count(text)
  ('a'..'z').count { |c| text.downcase.count(c) > 1 }
end

def duplicate_count(text)
  text = text.downcase
  seen = ''
  count = 0
  text.each_char.with_index do |char, i|
    if seen.index(char).nil?
      # not seen this char before, so is there a copy later in the string?
      if !text[i+1..text.size].index(char).nil?
        count += 1
      end
      seen += char
    end
  end
  return count
end

def duplicate_count(text)
  hsh = Hash.new(0)
  text.downcase.chars.each { |c| hsh[c] += 1 }
  hsh.values.count { |k| k > 1 }
end

p duplicate_count("")# 0)
p duplicate_count("abcde")# 0)
p duplicate_count("abcdeaa")# 1)
p duplicate_count("abcdeaB")# 2)
p duplicate_count("Indivisibilities")# 2)

# require "benchmark"
# n = 10000
# Benchmark.bm do |x|
#   x.report { n.times { duplicate_count1("IndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilities") } }
#   x.report { n.times { duplicate_count2("IndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilitiesIndivisibilities") } }
# end