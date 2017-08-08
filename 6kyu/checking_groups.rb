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

p group_check("{}([])")# true, "That group was matched correctly")
p group_check("{[{}[]()[]{}{}{}{}{}{}()()()()()()()()]{{{[[[((()))]]]}}}}(())[[]]{{}}[][][][][][][]({[]})")# true, "That group was matched correctly")
p group_check("")# true, "That group was matched correctly")
p group_check("{(})")# false, "That group was matched incorrectly")
p group_check("[{}{}())")# false, "That group was matched incorrectly")