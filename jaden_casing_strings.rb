# Jaden Smith, the son of Will Smith, is the star of films such as
# The Karate Kid (2010) and After Earth (2013). Jaden is also known
# for some of his philosophy that he delivers via Twitter. When writing
# on Twitter, he is known for almost always capitalizing every word.

# Your task is to convert strings to how they would be written by
# Jaden Smith. The strings are actual quotes from Jaden Smith, but 
# they are not capitalized in the same way he originally typed them.

# Example:

# Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
# Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real"
# Note that the Java version expects a return value of null for an empty
# string or null.

# MY SOLUTION
class String
  def toJadenCase
    self.split.map(&:capitalize).join(" ")
    # split.map(&:capitalize).join(" ")
  end
end

# BEST SOLUTION
class String
  def toJadenCase
  	first_letter = %r{
    	(?:\A | [^']) # A beginning of line or anything except an apostroph
      \b            # A word boundary
      ([a-z])       # Capturing the first letter
    }x # Enables nice, commented multiline regex
    self.gsub(first_letter, &:upcase) # Upcases each match
  end
end

class String
  def toJadenCase
    split.map(&:capitalize).join(' ')
  end
end

class String
  def toJadenCase
    # self.gsub(Regexp.union(/^./, /\s\w/), &:upcase)
    gsub(Regexp.union(/^./, /\s\w/), &:upcase)
  end
end

class String
  def toJadenCase
    gsub(/(\w|')+/, &:capitalize)
  end
end

str = "How can mirrors be real if our eyes aren't real";
# str = 'I say "go"'
# str = "I say \"go\""
p str.toJadenCase #, "How Can Mirrors Be Real If Our Eyes Aren't Real")