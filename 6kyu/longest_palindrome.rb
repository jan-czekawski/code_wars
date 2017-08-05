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

def expand(str, low_ix, hig_ix)
  if low_ix > 0 && hig_ix+1 < str.size && str[low_ix-1] == str[hig_ix+1]
    expand(str, low_ix-1, hig_ix+1)
  else
    return str[low_ix..hig_ix]
  end
end

def longest_palindrome(s)
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

p longest_palindrome("FourscoreandsevenyearsagoourfaathersbroughtforthonthiscontainentanewnationconceivedinzLibertyanddedicatedtothepropositionthatallmenarecreatedequalNowweareengagedinagreahtcivilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")# 1)
p longest_palindrome("aa")# 2)
p longest_palindrome("baa")# 2)
p longest_palindrome("aab")# 2)
p longest_palindrome("baabcd")# 4)
p longest_palindrome("baablkj12345432133d")# 9)