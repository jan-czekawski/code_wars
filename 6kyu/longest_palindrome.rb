# Longest Palindrome

# Find the length of the longest substring in the given 
# string s that is the same in reverse.

# As an example, if the input was “I like racecars that go 
# fast”, the substring (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# Example:

# "a" -> 1 
# "aab" -> 2  
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

# MY SOLUTION
def expand(str, low_ix, hig_ix)
  if low_ix > 0 && hig_ix+1 < str.size && str[low_ix-1] == str[hig_ix+1]
    expand(str, low_ix-1, hig_ix+1)
  else
    str[low_ix..hig_ix]
  end
end

def longest_palindrome1(s)
  s = s.downcase
  lng = s.size
  return lng if lng.zero?
  count = Hash.new(0)
  s.chars.each_with_index do |ltr, i|
    str = ltr
    if i+1 < lng && s[i+1] == ltr
      str = expand(s, i, i+1)
    elsif i > 0 && s[i-1] == ltr
      str = expand(s, i-1, i)
    elsif i > 0 && i+1 < lng && s[i+1] == s[i-1]  
      str = expand(s, i-1, i+1)
    end
    count[str] = str.size
  end
  count.values.max
end

# BEST SOLUTIONS
def longest_palindrome2(s)
  max_len = 0
  for i in 0..s.length - 1
    # check whether right neighboor is the same
    pal_base = (s[i] == s[i+1]) ? 2 : 1 
    # get palindrome length
    l = get_palindrome_length(s, i, pal_base)
    # check if it is the biggest so far
    max_len = l if l > max_len
  end
  max_len
end

def get_palindrome_length(s, i, l)
  return s.length if l > s.length
  return l if s[i-1] != s[i+l] or i == 0 or i + l > s.length
  get_palindrome_length(s, i-1, l+2)
end

def longest_palindrome(s)
  max_palindrome_len = 0
  for i in (0..s.length)
    for j in (i..s.length)
      substr = s[i..j]
      if substr == substr.reverse && substr.length > max_palindrome_len
        max_palindrome_len = substr.length
      end
    end
  end
  return max_palindrome_len
end

def longest_palindrome(s)
  s.length.downto(1) do |n|
    s.chars.each_cons(n) do |arr|
      return n if arr == arr.reverse
    end
  end
  0
end

def is_palindrome?(string)
  num_chars = string.length
  (0..(num_chars / 2)).each do |i|
    return false if !(string[i] == string[num_chars - 1 - i])
  end
  true
end

def longest_palindrome(s)
  return 0 if s == ""
  offset = 0
  length = s.length
  while (length - offset) > 0
    for i in (0..offset)
      if is_palindrome?(s[i..(i + length - offset)])
        return s[i..(i + length - offset)].length
      end
    end
    offset += 1
  end
end

def longest_palindrome(s)
  return 0 if s == ""
  word_start, word_end = 0, 1
  palindromes = []
  while s[word_start]
    word = s[word_start..word_end]
    if word_end == s.length
      word_start += 1
      word_end = word_start + 1  
    elsif word == word.reverse
      palindromes << word.length
      word_start = word_end
      word_end += 1
    else
      word_end += 1
    end
  end
  palindromes.max || 1
end

def longest_palindrome(s)
  return 0 if s.empty?
  (s.length).downto(1).each do | i |
    s.split(//).each_cons(i).map do |c|
      return c.count if c == c.reverse
    end
  end
end

def longest_palindrome(s)
  length = s.length
  return length unless length > 1

  chars = s.chars
  
  length.downto(1).each do |word_size|
    words_of_size = chars.each_cons(word_size)
    return word_size if words_of_size.any? { |word| palindrome?(word) }
  end
end

def palindrome?(reversible)
  reversible == reversible.reverse
end


def polyndrom? s
  s == s.reverse
end

def longest_palindrome(s)
  return 0 if s.empty?
  
  max = 1
  (0..s.size).each do |i|
    (i..s.size).each do |j|
      part = s[i..j]
      max = [max, part.size].max if polyndrom? part
    end
  end
  max
end



# p longest_palindrome("FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")# 1)
# p longest_palindrome("aa")# 2)
# p longest_palindrome("baa")# 2)
# p longest_palindrome("aab")# 2)
# p longest_palindrome("baabcd")# 4)
# p longest_palindrome("baablkj12345432133d")# 9)

require "benchmark"
n = 1
Benchmark.bm do |x|
  x.report { n.times {longest_palindrome1("FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")} }
  x.report { n.times {longest_palindrome2("FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")} }
end