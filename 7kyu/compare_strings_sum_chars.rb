# Compare two strings by comparing the sum of their values (ASCII character code).
# For comparing treat all letters as UpperCase.

# Null-Strings should be treated as if they are empty strings.
# If the string contains other characters than letters,
# treat the whole string as it would be empty.

# Examples:

# "AD","BC" -> equal

# "AD","DD" -> not equal

# "gf","FG" -> equal

# "zz1","" -> equal

# "ZzZz", "ffPFF" -> equal

# "kl", "lz" -> not equal

# null, "" -> equal

# Your method should return true, if the strings are
# equal and false if they are not equal.


def compare(s1,s2)
  [s1, s2].map do |word|
    word = word.upcase unless word.nil?
    word = "" if word.nil?
    word.chars.each do |let|
      if let =~ /^[a-z]/i
        word = ""
      end
    end
    
    word
    # p word, word =~ /[a-z]/i
    # if word.nil? || word =~ /[a-z]/
    #   word = ""
    # else
    #   word
    # end
  end
  # [s1.upcase.ord, s2.upcase.ord]
end



# p compare("AD", "BC")# true, "\'AD\' vs \'BC\'")
# p compare("AD", "DD")# false, "\'AD\' vs \'DD\'")
# p compare("gf", "FG")# true, "\'gf\' vs \'FG\'")
# p compare("Ad", "DD")# false, "\'Ad\' vs \'DD\'")
p compare("zz1", "")# true, "\'zz1\' vs \'\'")
# p compare("ZzZz", "ffPFF")# true, "\'ZzZz\' vs \'ffPFF\'")
p compare("kl", "lz")# false, "\'kl\' vs \'lz\'")
p compare(nil, "")# true, "\'<null>\' vs \'\'")
p compare("!!", "7476")# true, "\'!!\' vs \'7476\'")
p compare("##", "1176")# true, "\'##\' vs \'1176\'")
