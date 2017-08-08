# In English and programming, groups can be made using symbols 
# such as "()" and "{}" that change meaning. However, these groups
# must be closed in the correct order to maintain correct syntax.

# Your job in this kata will be to make a program that checks a 
# string for correct grouping. For instance, the following groups are done correctly:

# ({})
# [[]()]
# [{()}]
# The next are done incorrectly

# {(})
# ([]
# [])
# A correct string cannot close groups in the wrong order, 
# open a group but fail to close it, or close a group before it is opened.

# Your function will take an input string that may contain any of 
# the symbols "()" "{}" or "[]" to create groups.

# It should return True if the string is empty or otherwise grouped 
# correctly, or False if it is grouped incorrectly.

# MY SOLUTION
def group_check(s)
  before = ""
  while before != s
    before = s
    s = s.gsub(/(   \(\) | \[\] |  \{\}   )/x, '')
  end
  s.empty?
end

def group_check(s)
  stack = []
  symbols = { '{' => '}', '[' => ']', '(' => ')' }
  s.each_char do |c|
    stack << c if symbols.key?(c)
    return false if symbols.key(c) && symbols.key(c) != stack.pop
  end
  stack.empty?
end

def group_check s
  loop do
    return true if s.empty?
    c = s.gsub /(\{\})|(\[\])|(\(\))/, ''
    return false if c == s
    s = c
  end
end

def group_check(s)
  #Think of strings as noncommutative products of group elements
  #with {, [, and ( all distinct, and }, ], and ) their "inverses"
  #keep substituting any (), {}, or [] with ""
  #if the string fails to reduce, it was formatted incorrectly
  #at most s.length/2 iterations will be necessary
  (1..(s.length/2)).each do
    smaller_s = s.sub(/\(\)|\[\]|\{\}/,"");
    return false if smaller_s.length==s.length
    s = smaller_s
  end
  
  s == ""
end

def group_check(s)
  lambda{|a| a!=s ? group_check(a) : a==""}.(s.gsub("()","").gsub("[]","").gsub("{}",""))
end

BRACKETS = { ")" => "(", "}" => "{", "]" => "[" }

def group_check(s)
  s.chars.each_with_object([]) { |symbol, stack|
    case symbol
    when *BRACKETS.values
      stack.push symbol
    when *BRACKETS.keys
      return false unless stack.last == BRACKETS[symbol]
      stack.pop
    end
  }.empty?
end

def group_check(s)
  while s.gsub!(/(\(\)|\[\]|\{\})/,'') do; end
  s.empty?
end

p group_check("{}([])")# true, "That group was matched correctly")
p group_check("{[{}[]()[]{}{}{}{}{}{}()()()()()()()()]{{{[[[((()))]]]}}}}(())[[]]{{}}[][][][][][][]({[]})")# true, "That group was matched correctly")
p group_check("")# true, "That group was matched correctly")
p group_check("{(})")# false, "That group was matched incorrectly")
p group_check("[{}{}())")# false, "That group was matched incorrectly")