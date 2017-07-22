# This kata is part of a series on the Morse code. After you 
# solve this kata, you may move to the next one.

# In this kata you have to write a simple Morse code decoder.
# While the Morse code is now mostly superceded by voice and 
# digital data communication channels, it still has its use in 
# some applications around the world.
# The Morse code encodes every character as a sequence of "dots" 
# and "dashes". For example, the letter A is coded as ·−, letter Q
# is coded as −−·−, and digit 1 is coded as ·−−−. The Morse code
# is case-insensitive, traditionally capital letters are used.
# When the message is written in Morse code, a single space is 
# used to separate the character codes and 3 spaces are used to 
# separate words. For example, the message HEY JUDE in 
# Morse code is ···· · −·−−   ·−−− ··− −·· ·.

# NOTE: Extra spaces before or after the code have no meaning 
# and should be ignored.

# In addition to letters, digits and some punctuation, there are
# some special service codes, the most notorious of those is the
# international distress signal SOS (that was first issued by
# Titanic), that is coded as ···−−−···. These special codes are
# treated as single special characters, and usually are transmitted
# as separate words.

# Your task is to implement a function decodeMorse(morseCode), that
# would take the morse code as input and return a decoded human-readable string.

# For example:

# decodeMorse('.... . -.--   .--- ..- -.. .')
# #should return "HEY JUDE"
# The Morse code table is preloaded for you as a dictionary, feel
# free to use it. In CoffeeScript, C++, JavaScript, PHP, Python,
# Ruby and TypeScript, the table can be accessed like this:
# MORSE_CODE['.--'], in Java it is MorseCode.get('.--'), in C# it
# is MorseCode.Get('.--'), in Haskell the codes are in a Map String String and
# can be accessed like this: morseCodes ! ".--", in Elixir it is morse_codes variable.

# All the test strings would contain valid Morse code, so you may
# skip checking for errors and exceptions. In C#, tests will fail if
# the solution code throws an exception, please keep that in mind. 
# This is mostly because otherwise the engine would simply ignore 
# the tests, resulting in a "valid" solution.


# Good luck!

# After you complete this kata, you may try yourself at Decode the Morse code, advanced.

MORSE_CODE = { 
               ".-"     => "A",
               "-..."   => "B",
               "-.-."   => "C",
               "-.."    => "D",
               "."      => "E",
               "..-."   => "F",
               "--."    => "G",
               "...."   => "H",
               ".."     => "I",
               ".---"   => "J",
               "-.-"    => "K",
               ".-.."   => "L",
               "--"     => "M",
               "-."     => "N",
               "---"    => "O",
               ".--."   => "P",
               "--.-"   => "Q",
               ".-."    => "R",
               "..."    => "S",
               "-"      => "T",
               "..-"    => "U",
               "...-"   => "V",
               ".--"    => "W",
               "-..-"   => "X",
               "-.--"   => "Y",
               "--.."   => "Z",
               ".----"  => "1",
               "..---"  => "2",
               "...--"  => "3",
               "....-"  => "4",
               "....."  => "5",
               "-...."  => "6",
               "--..."  => "7",
               "---.."  => "8",
               "----."  => "9",
               "-----"  => "0"
             }
# MY SOLUTION
def decodeMorse(code)
  code.strip.split("   ").map(&:split).map do |word|
    word.map { |let| MORSE_CODE[let] }.join
  end.join(" ")
end

# BEST SOLUTIONS
def decodeMorse(morseCode)
  morseCode.strip
           .split('   ')
           .map { |word| decodeWord(word) }
           .join(' ')
end

private

def decodeWord(morseCode)
  morseCode.split
           .map { |char| MORSE_CODE[char] }
           .join
end

def decodeMorse(morseCode)
  # Split the code up into words based on the three-space seperator and
  # then decode each word in the resulting array.
  words = morseCode.strip.split('   ').map { |word| decodeWord word }
  
  # Return the english sentence with single space seperators between each word.
  words.join ' '
end

def decodeWord(word)
  # Split the word up into individual letters based on the single-space
  # seperator and decode each letter in the resulting array.
  letters = word.split(' ').map { |letter| MORSE_CODE[letter] }
  
  # Return the english word as a whole.
  letters.join ''
end

def decodeMorse(morseCode)
  morseCode.strip.gsub(/[.-]*/) {|charCode| MORSE_CODE[charCode] }.gsub(/  ?([^\ ])/, '\1')
end

def decodeMorse(morseCode)
  #your brilliant code here
  morseCode.strip.gsub('   ',' # ').split(' ').map{|x| x == '#'? ' ' : MORSE_CODE[x]}.join
end

p decodeMorse('.... . -.--   .--- ..- -.. .') #, 'HEY JUDE')