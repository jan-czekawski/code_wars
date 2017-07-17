# Doesn't everyone love a haiku?

# If you don't know what that is, let me make your day :D

# A haiku is a traditional form of Japanese poetry, they normally have 3 lines 
# with 5, 7 and 5 syllables respectively. For example:

# codewars training day
# regular expressions mean
# many cups of tea
# Feeling a little concerned that I'm about to ask you to write poetry? Fear not!
# You only have to translate the haiku from numbers to words, no need to start
# looking frantically for creative inspiration. Let me explain:

# I'm giving you:

# a function, haikuWizard(), which you have to complete.
# a big, predefined array with lots of words organised in subarrays! As you can 
# see, each subarray has 10 members and they are all words with the same number 
# of syllables. So words[0] contains words of 1 syllable, words[1] contains words
# of 2 syllables and so on.

# Back to our function: haikuWizard() takes an array as its input. This array
# has 3 subarrays - each subarray represents a line of the haiku. For example:

# [[52], [17, 23, 39, 18], [33, 22]]

# For each number, the first digit tells you the number of syllables of 
# the word, the second digit tells you which member of the relevant subarray it is.

# For example:

# 52: This means that the first line is made up of one word with 5 syllables,
# at index 2 in words[4].

# [17, 23, 39, 18]: This means that the second line is made up of 4 words.
# The first has 1 syllable and is at index 7 in words[0]. The second has 2 syllables
# and is at index3 in words[1]. And so on...

# All you have to do is complete the function haikuWizard() so that it 
# translates the given array back into the beautiful haiku it came from :)

# You should return a string, which on using console.log should display
# in the appropriate haiku format:

# console.log(str);

# there's a trumpet man
# waltzing around the canals
# he's getting dizzy
# The string itself will not have this format.

# To summarise in case you don't feel like reading all that again:

# haikuWizard() should turn arr into a haiku using the array words.
# arr has 3 subarrays, each represents a line of the haiku.
# the first digit of each number in arr represents the number of syllables 
# of the word, the second digit is its index in the relevant subarray of words.
# the return string should display a beautiful haiku with the correct structure.
# Enjoy!

# WORDS = [
$words = [
["like", "a", "tweet", "what", "for", "world", "whale", "one", "last", "sun"],
["ocean", "beauty", "tweet", "monster", "yellow", "return", "despair", "flower", "return", "contrast"],
["romantic", "curious", "banana", "jealousy", "tactlessly", "remorseful", "follower", "elephant", "however", "instagram"],
["salmonella", "consequently", "irregular", "intelligence", "vegetable", "ordinary", "alternative", "watermelon", "controversial", "marijuana"],
["lackadaisical", "serendipity", "colonoscopy", "dramatically", "parsimonius", "imagination", "electricity", "diabolical", "deforestation", "abomination"],
["extraterrestrial", "onomatopoeia", "responsibility", "revolutionary", "generalisation", "enthusiastically", "biodiversity", "veterinarian", "characteristically", "indefatigable"],
["oversimplification", "individuality", "decriminalisation", "compartmentalisation", "anaesthesiologist", "industrialisation", "buckminsterfullerene", "irresponsibility", "autobiographical", "utilitarianism"]]


# MY SOLUTION
def haiku_wizard(arr)
  txt = ""
  arr.each_with_index do |line, ln_id|
    line.each_with_index do |wrd, wd_id|
      txt << WORDS[wrd.to_s[0].to_i - 1][wrd.to_s[1].to_i]
      txt << " " unless wd_id == line.size - 1
    end
    txt << "\n" unless ln_id == arr.size - 1
  end
  txt
end

# BEST SOLUTIONS
def haiku_wizard(arr)
  arr.map do |sub_arr|
    sub_arr.map do |numb|
      a, b = numb.to_s.chars.map(&:to_i)
      $words[a-1][b]
    end.join(" ")
  end.join("\n")
end


def get_word(num)
  num = num.to_s
  $words[num[0].to_i - 1][num[1].to_i]
end

def haiku_wizard(arr)
  arr.map{ |x| x.map{ |num| get_word(num) }.join(" ") }.join("\n")
end


def haiku_wizard(arr)
  arr.map do |subarray|
    subarray.map do |num|
      verse_index = (num/10) - 1
      word_index = (num%10)
      $words[verse_index][word_index]
    end.join(" ")
  end.join("\n")
end

p haiku_wizard([[10, 11, 23, 16], [50, 12, 14], [15, 40]]) # "like a monster whale\nlackadaisical tweet for\nworld salmonella")
p haiku_wizard([[11, 30, 17], [51, 21], [52]]) # "a romantic one\nserendipity beauty\ncolonoscopy")
p haiku_wizard([[47, 16], [63, 12], [33, 29]]) # "watermelon whale\nrevolutionary tweet\njealousy contrast")
p haiku_wizard([[14, 27, 26], [75], [53]]) # "for flower despair\nindustrialisation\ndramatically")
p haiku_wizard([[58], [70], [50]]) # "deforestation\noversimplification\nlackadaisical")
p haiku_wizard([[10, 19, 38], [22, 28, 20, 18], [48, 11]]) # "like sun however\ntweet return ocean last\ncontroversial a")
