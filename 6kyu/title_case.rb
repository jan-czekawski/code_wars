# A string is considered to be in title case if each word in the 
# string is either (a) capitalised (that is, only the first letter
# of the word is in upper case) or (b) considered to be an exception
# and put entirely into lower case unless it is the first word, which is always capitalised.

# Write a function that will convert a string into title case,
# given an optional list of exceptions (minor words). The 
# list of minor words will be given as a string with each 
# word separated by a space. Your function should ignore the
# case of the minor words string -- it should behave in the 
# same way even if the case of the minor word string is changed.

# ###Arguments (Haskell)

# First argument: space-delimited list of minor words that must 
# always be lowercase except for the first word in the string.
# Second argument: the original string to be converted.
# ###Arguments (Other languages)

# First argument (required): the original string to be converted.
# Second argument (optional): space-delimited list of minor words 
# that must always be lowercase except for the first word in the 
# string. The JavaScript/CoffeeScript tests will pass undefined when 
# this argument is unused.
# ###Example

# title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
# title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
# title_case('the quick brown fox') # should return: 'The Quick Brown Fox'

# MY SOLUTION
def title_case(title, *minor_words)
  minor_words = minor_words[0].split.map(&:capitalize) if minor_words[0]
  title.split.each_with_index do |word, ix| 
    word.capitalize!
    word.downcase! if minor_words.include?(word) && ix != 0
  end.join(" ")
end

# BEST SOLUTIONS
def title_case(title, minor_words = '')
  title.capitalize
       .split()
       .map{ |a| minor_words.downcase
                            .split()
                            .include?(a) ? a : a.capitalize }.join(' ')
end

def title_case(title, minor_words = '')
  minor_words_as_array = minor_words.downcase.split(' ')
  title_as_array = title.capitalize.split(' ')
    
  title_as_array.map { |word| capitalize_no_minor_words(word, minor_words_as_array) }.join(' ')
end

def capitalize_no_minor_words(word, minor_words_as_array)
  minor_words_as_array.include?(word) ? word : word.capitalize
end

def title_case(title, minor_words = '')
  title.capitalize.gsub(/\w+/) { |word|
    (minor_words.downcase.split(/ /).include? word.downcase)? word: word.capitalize
  }
end

def title_case(title, minor_words = '')
  title = title.split.map { |word| word.downcase }
  minor_words = minor_words.split.map { |word| word.downcase }
  
  title.each_with_index.map do |word, index|
    (index == 0 or ! minor_words.include? word) ? word.capitalize : word
  end.join(' ')
  
end

def title_case(title, minor_words='')
  title.capitalize.gsub(/\w+/){|a| minor_words[/\b#{a}\b/i] ? a : a.capitalize }
end

p title_case('')# '')
p title_case('a clash of KINGS', 'a an the of')# 'A Clash of Kings')
p title_case('THE WIND IN THE WILLOWS', 'The In')# 'The Wind in the Willows')
p title_case('the quick brown fox')# 'The Quick Brown Fox')
