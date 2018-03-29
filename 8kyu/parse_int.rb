# Ask a small girl - "How old are you?". 
# She always says strange things... Lets help her!

# For correct answer program should 
# return int from 0 to 9.

# Assume test input string always valid and
# may look like "1 year old" or "5 years old", etc.. The first char is number only.

# MY SOLUTION
def get_age(age)
  # age.sub(/\d+/) { |num| return num.to_i }
  age.sub(/^(\d+).*/, '\1').to_i
end

# BEST SOLUTIONS
def get_age(age)
   age.to_i
end

def get_age(a)
  a[0].to_i
end

def get_age(age)
  age.slice(0).to_i
end

def get_age(age) 
  age.split('')
  age[0].to_i
end

p get_age("0 years old") #, 0)
p get_age("2 years old") #, 2)
p get_age("4 years old") #, 4)
p get_age("5 years old") #, 5)
p get_age("7 years old") #, 7)