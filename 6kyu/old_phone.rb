# Prior to having fancy iPhones, teenagers would wear out
# their thumbs sending SMS messages on candybar-shaped
# feature phones with 3x4 numeric keypads.

# ------- ------- -------
# |     | | ABC | | DEF |
# |  1  | |  2  | |  3  |
# ------- ------- -------
# ------- ------- -------
# | GHI | | JKL | | MNO |
# |  4  | |  5  | |  6  |
# ------- ------- -------
# ------- ------- -------
# |PQRS | | TUV | | WXYZ|
# |  7  | |  8  | |  9  |
# ------- ------- -------
# ------- ------- -------
# |     | |space| |     |
# |  *  | |  0  | |  #  |
# ------- ------- -------
# Prior to the development of T9 (predictive text entry) 
# systems, the method to type words was called "multi-tap"
# and involved pressing a button repeatedly to cycle through
# the possible values.

# For example, to type a letter "R" you would press the 7
# key three times (as the screen display for the current 
# character cycles through P->Q->R->S->7). A character is 
# "locked in" once the user presses a different key or pauses
# for a short period of time (thus, no extra button presses
# are required beyond what is needed for each letter individually).
# The zero key handles spaces, with one press of the key
# producing a space and two presses producing a zero.

# In order to send the message "WHERE DO U WANT 2 MEET L8R" 
# a teen would have to actually do 47 button presses.
# No wonder they abbreviated.

# For this assignment, write a module that can calculate
# the amount of button presses required for any phrase. 
# Punctuation can be ignored for this exercise. Likewise,
# you can assume the phone doesn't distinguish between 
# upper/lowercase characters (but you should allow your
# module to accept input in either for convenience).

# Hint: While it wouldn't take too long to hard code the 
# amount of keypresses for all 26 letters by hand, try
# to avoid doing so! (Imagine you work at a phone manufacturer
# who might be testing out different keyboard layouts, and you
# want to be able to test new ones rapidly.)

# MY SOLUTION
def presses(phrase)
  phone = [ "1", "ABC2", "DEF3", "GHI4", "JKL5", "MNO6", 
            "PQRS7", "TUV8", "WXYZ9", "*", " 0", "#" ]
  
  phrase.upcase.chars.map do |chr|
    phone.each do |combo|
      break combo.index(chr) + 1 if combo.include?(chr)
    end
  end.inject(&:+)
end

# BEST SOLUTIONS
def presses(phrase)
  groups = ["1", " 0", "ABC2", "DEF3", "GHI4", "JKL5", "MNO6", "TUV8", "PQRS7", "WXYZ9"]
  phrase.upcase.chars.map do |c|
    1 + groups.find { |grp| grp.include?(c) }.index(c)
  end.reduce(:+)
end

def presses(phrase)
  buttons = ['1', 'abc2', 'def3', 'ghi4', 'jkl5', 'mno6', 'pqrs7', 'tuv8', 'wxyz9', ' 0']
  phrase.downcase.each_char.map {|char|
    buttons.lazy.map{|b| b.index(char)}.find{|i| i } + 1
  }.reduce(:+)
end

def get_char_presses(c)
  buttons = [ '1',     'ABC2', 'DEF3',
              'GHI4',  'JKL5', 'MNO6',
              'PQRS7', 'TUV8', 'WXYZ9',
              '*',     ' 0',   '#' ]
  buttons.each { |b| if (res = b.index(c)) then return res + 1; end }
end

def presses(phrase)
  phrase.chars.collect { |c| get_char_presses c.upcase }.reduce(:+)
end

def presses(phrase)
  layout = ['1', 'ABC2', 'DEF3', 'GHI4', 'JKL5', 'MNO6', 'PQRS7', 'TUV8', 'WXYZ9', ' 0']
  phrase.upcase.chars.map {|x| layout.select {|y| y.include?(x)}[0].chars.index(x) + 1}.reduce(:+)
end

def presses(phrase)
  phrase.upcase.chars.inject(0){|sum, x| sum + index_of(x)}
end

def index_of x
  %w(1 ABC2 DEF3 GHI4 JKL5 MNO6 PQRS7 TUV8 WXYZ9 * # \ 0).each do |key|
    return key.chars.index(x) + 1 if key.chars.index(x)
  end
end

def presses(phrase)
  al,pr = " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ","1214444454512312312312312312341231234"
  phrase.upcase.chars.map{|l|pr[al.index(l)||'0']}.reduce(0){|s,x|s+x.to_i}
end

p presses("LOL")#, 9
p presses("HOW R U")#, 13