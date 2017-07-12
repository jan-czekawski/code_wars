# Write simple .camelcase method (camel_case function in PHP) 
# for strings. All words must have their first letter capitalized
# without spaces.

# For instance:

# 'hello case'.camelcase => HelloCase
# 'camel case word'.camelcase => CamelCaseWord

# MY SOLUTION 
class String
  def camelcase
    self.gsub(/\b[a-z]/) { |let| let.upcase }.gsub(/\s/, '')
    # self.gsub(/\b[a-z]/, &:upcase).gsub(/\s/, '')
  end
end

# BEST SOLUTIONS
class String
  def camelcase
    self.split.map(&:capitalize).join
    # self.split(" ").map { |word| word.capitalize }.join("")
  end
end

class String
  def camelcase
    self.gsub(/\w+/, &:capitalize).delete(' ')
  end
end

p ('test case'.camelcase) # 'TestCase')
p ('camel case method'.camelcase) # 'CamelCaseMethod')
p ('say hello '.camelcase) # 'SayHello')
p (' camel case word'.camelcase) # 'CamelCaseWord')