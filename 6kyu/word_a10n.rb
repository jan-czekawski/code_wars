# The word i18n is a common abbreviation of internationalization 
# the developer community use instead of typing the whole word 
# and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

# Write a function that takes a string and turns any and all 
# "words" (see below) within that string of length 4 or greater
# into an abbreviation following the same rules.

# Notes:

# A "word" is a sequence of alphabetical characters. 
# By this definition, any other character like a space 
# or hyphen (eg. "elephant-ride") will split up a 
# series of letters into two words (eg. "elephant" and "ride").
# The abbreviated version of the word should have the 
# first letter, then the number of removed characters, 
# then the last letter (eg. "elephant ride" => "e6t r2e").
# Example:

# abbreviate("elephant-rides are really fun!")
# //          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
# // words (^):   "elephant" "rides" "are" "really" "fun"
# //                123456     123     1     1234     1
# // ignore short words:               X              X

# // abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
# // all non-word characters (*) remain in place
# //                     "-"      " "    " "     " "     "!"
# === "e6t-r3s are r4y fun!"

# MY SOLUTION
class Abbreviator
  def self.abbreviate(string)
    string.gsub(/(?<=[a-z])[a-z]{2,}(?=[a-z])/i) { |shrt| shrt.size }
  end
end

# BEST SOLUTIONS
class Abbreviator
  def self.abbreviate(string)
    string.gsub(/(\w)(\w{2,})(\w)/i) { "#{$1}#{$2.size}#{$3}" }
  end
end

require 'strscan'

class Abbreviator
  def self.abbreviate(string)
    scanner = StringScanner.new(string)
    result = ''
    loop do
      word = scanner.scan(/\w+/)
      break if word.nil?
      len = word.length
      result << ((len >= 4) ? "#{word[0]}#{len-2}#{word[-1]}" : word)
      sep = scanner.scan(/\W+/)
      break if sep.nil?
      result << sep
    end
    result
  end
end

class Abbreviator
  def self.abbreviate(string)
    string.gsub(/([a-z]+)/i) {|w| w.length < 4 ? w : w[0] + (w.length - 2).to_s + w[-1]}
  end
end

class Abbreviator
  def self.abbreviate(string) 
    string.gsub!(/\w{4,}/) do |match|
       "#{match[0]}#{match.size-2}#{match[-1]}"
    end
  end
end

class Abbreviator
# module Abbreviator
  # module_function
  
  def self.abbreviate(string)
    string.gsub(/(?<=[a-z])[a-z]{2,}(?=[a-z])/i, &:length)
  end
end

p Abbreviator.abbreviate("banana")# "b4a", Abbreviator.abbreviate("banana") )
p Abbreviator.abbreviate("ban1ana")# "b4a", Abbreviator.abbreviate("banana") )
p Abbreviator.abbreviate("double-barrel")# "d4e-b4l", Abbreviator.abbreviate("double-barrel") )
p Abbreviator.abbreviate("You, and I, should speak.")# "You, and I, s4d s3k.", Abbreviator.abbreviate("You, and I, should speak.") )