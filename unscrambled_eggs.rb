# Unscramble the eggs.

# The string given to your function has had an "egg" inserted directly
# after each consonant. You need to return the string before it became eggcoded.

# example:

# unscrambleEggs("Beggegeggineggneggeregg"); => Beginner

# Kata is supposed to be for beginners to practice regular 
# expressions, so commenting would be appreciated.

# MY SOLUTION
def unscramble_eggs(word)
  word.gsub(/egg/, '')
end

# CLEVER SOLUTION
def unscramble_eggs(word)
  return word.split('egg').join('')
end


CONSONANTS = ('a'..'z').to_a - %w[a e i u o ]
def unscramble_eggs(word)
  word.gsub(/([#{CONSONANTS}])egg/i, '\1')
end

def unscramble_eggs(word)
  word.gsub(/([^aeiou])egg/i, '\1')
end

p unscramble_eggs("ceggodegge heggeregge") #, "code here")
p unscramble_eggs("FeggUNegg KeggATeggA") #,"FUN KATA")