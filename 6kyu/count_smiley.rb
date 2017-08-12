# Description:
# Given an array (arr) as an argument complete the function 
# countSmileys that should return the total number of smiling faces.

# Rules for a smiling face:
# -Each smiley face must contain a valid pair of eyes. 
# Eyes can be marked as : or ;
# -A smiley face can have a nose but it does not have to. 
# Valid characters for a nose are - or ~
# -Every smiling face must have a smiling mouth that should 
# be marked with either ) or D.
# No additional characters are allowed except for those 
# mentioned.
# Valid smiley face examples:
# :) :D ;-D :~)
# Invalid smiley faces:
# ;( :> :} :] 

# Example cases:

# countSmileys([':)', ';(', ';}', ':-D']);       // should return 2;
# countSmileys([';D', ':-(', ':-)', ';~)']);     // should return 3;
# countSmileys([';]', ':[', ';*', ':$', ';-D']); // should return 1;

# Note: In case of an empty array return 0. You will not 
# be tested with invalid input (input will always be an array)

# Happy coding!

# MY SOLUTION
def count_smileys(arr)
  # arr.grep(/(\:|\;)(\-|\~)?(\)|D)/).count
  arr.grep(/\A(\:|\;)(\-|\~)?(\)|D)\z/).count
end

# BEST SOLUTIONS
def count_smileys(arr)
  # arr.count { |e| e =~ /(:|;){1}(-|~)?(\)|D)/ }
  arr.count { |e| e =~ /(:|;)(-|~)?(\)|D)/ }
end

def count_smileys(arr)
  arr.count { |e| e =~ /[:;][-~]?[)D]/ }
end

def count_smileys(arr)
arr.select { |x| 
x[0].match(/[:|;]/) and  
x[-1].match(/[)|D]/) and 
(x.size==2 ? true : x[1].match(/[-|~]/) )}.size
end

p count_smileys([])# 0)
p count_smileys([":D",":~)",";~D",":)"])# 4)
p count_smileys([":)",":(",":D",":O",":;"])# 2)
p count_smileys([";]", ":[", ";*", ":$", ";-D"])# 1)
p count_smileys([";", ")", ";*", ":$", "8-D"])# 0)
p count_smileys([";DD"])# 0)
