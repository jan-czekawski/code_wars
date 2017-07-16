# Unscramble the eggs.

# The string given to your function has had an "egg" inserted directly
# after each consonant. You need to return the string before it became eggcoded.

# example:

# unscrambleEggs("Beggegeggineggneggeregg"); => Beginner

# Kata is supposed to be for beginners to practice regular 
# expressions, so commenting would be appreciated.


def unscramble_eggs(word)
  word.gsub(/egg/, '')
end


p unscramble_eggs("ceggodegge heggeregge") #, "code here")
p unscramble_eggs("FeggUNegg KeggATeggA") #,"FUN KATA")