# Move the first letter of each word to the end of it, then add 'ay' to the end of the word.

# pig_it('Pig latin is cool') # igPay atinlay siay oolcay

# MY SOLUTION
def pig_it(text)
  text.gsub(/\b([a-z0-9]?)([a-z0-9]+)\b/i, '\2\1ay')
  # text.gsub(/\b([a-z0-9])([a-z0-9]+)*\b/i, '\2\1ay')
  # text.gsub(/([a-z0-9])([a-z0-9]+)*/i, '\2\1ay')
end

# BEST SOLUTION
def pig_it(text)
  text.gsub(/(\w)(\w+)*/, '\2\1ay')
end

p pig_it('Pig latin is cool') #,'igPay atinlay siay oolcay')
p pig_it('This is my string') #,'hisTay siay ymay tringsay');
p pig_it('0 is my string') #,'hisTay siay ymay tringsay');
p pig_it('O is my string') #,'hisTay siay ymay tringsay');
