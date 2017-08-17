# Everyone knows passphrases. One can choose passphrases 
# from poems, songs, movies names and so on but frequently
# they can be guessed due to common cultural references. 
# You can get your passphrases stronger by different means. 
# One is the following:

# choose a text in capital letters including or not digits
# and non alphabetic characters,

# shift each letter by a given number but the transformed 
# letter must be a letter (circular shift),
# replace each digit by its complement to 9,
# keep such as non alphabetic and non digit characters,
# downcase each letter in odd position, upcase each letter
# in even position (the first character is in position 0),
# reverse the whole result.
# #Example:

# your text: "BORN IN 2015!", shift 1

# 1 + 2 + 3 -> "CPSO JO 7984!"

# 4 "CpSo jO 7984!"

# 5 "!4897 Oj oSpC"

# With longer passphrases it's better to have a small and
# easy program. Would you write it?

# https://en.wikipedia.org/wiki/Passphrase


# a => 97
# z => 122
# A => 65
# Z => 90

def play_pass(str, n)
  str.chars.map.with_index do |ltr, idx|
    if ltr =~ /[a-zA-Z]/
      if ltr.ord + n > 90 || ltr.ord + n > 122
        ltr = (ltr.ord - 26 + n).chr
      else
        ltr = (ltr.ord + n).chr
      end
      ltr = ltr.downcase if idx.odd?
      ltr = ltr.upcase if idx.even?
      ltr
    elsif ltr =~ /\d/
      ltr = 9 - ltr.to_i
    else
      ltr
    end
  end.join.reverse
end

p play_pass("I LOVE YOU!!!", 1)#, "!!!vPz fWpM J")
p play_pass("BORN IN 2015!", 1) #"!4897 Oj oSpC"

p play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2)#    "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO")
