# Trolls are attacking your comment section!

# A common way to deal with this situation is to remove all of the
# vowels from the trolls' comments, neutralizing the threat.

# Your task is to write a function that takes a string and return a
# new string with all vowels removed.

# For example, the string "This website is for losers LOL!" would 
# become "Ths wbst s fr lsrs LL!".

# MY SOLUTION
def disemvowel(str)
  str.gsub(/[aeiou]/i, '')
end

# CLEVER SOLUTIONS
def disemvowel(str)
  str.delete('aeiouAEIOU')
end

def disemvowel(str)
  vowels = 'aouei'
  str.delete(vowels + vowels.upcase)
end

p disemvowel("This website is for losers LOL!") #,"Ths wbst s fr lsrs LL!")

# require "benchmark"

# Benchmark.bm do |m|
# m.report('delete'){ 1_000_000.times { 'this is a string'.delete('aeiouAEIOU') } }
# m.report('gsub'){ 1_000_000.times { 'this is a string'.gsub(/aeiouAEIOU/,'') } }
# end