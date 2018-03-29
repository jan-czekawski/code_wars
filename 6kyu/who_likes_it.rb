# You probably know the "like" system from Facebook and other pages. 
# People can "like" blog posts, pictures or other items. We want to 
# create the text that should be displayed next to such an item.

# Implement a function likes :: [String] -> String, which must take 
# in input array, containing the names of people who like an item. 
# It must return the display text as shown in the examples:

# likes [] // must be "no one likes this"
# likes ["Peter"] // must be "Peter likes this"
# likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
# likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
# likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"
# For more than 4 names, the number in and 2 others simply increases.

# MY SOLUTION
def likes(names)
  str = ""
  case names.size
  when 0  then str = "no one"
  when 1  then str = "#{names[0]}"
  when 2  then str = "#{names[0]} and #{names[1]}"
  when 3  then str = "#{names[0]}, #{names[1]} and #{names[2]}"  
  else         str = "#{names[0]}, #{names[1]} and #{names.size - 2} others"
  end
  "#{str} like#{names.size < 2 ? "s" : ""} this"
end

# BEST SOLUTIONS
def likes(names)
  formats = [
    'no one likes this',
    '%s likes this',
    '%s and %s like this',
    '%s, %s and %s like this'
  ]
  if names.length > 3
    return '%s, %s and %d others like this' % [names[0], names[1], names.length - 2]
  else
    return formats[names.length] % names
  end
end

def likes(names)
  case names.length
  when 0
    "no one likes this"
  when 1
    "%s likes this" % names
  when 2
    "%s and %s like this" % names
  when 3
    "%s, %s and %s like this" % names
  else
    "%s, %s and %d others like this" %
      [names[0], names[1], names.length - 2]
  end
end

def likes(names)
  case names.size
  when 0 
    "no one likes this"
  when 1 
    "#{names[0]} likes this"
  when 2
    "#{names[0]} and #{names[1]} like this"
  when 3
    "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else
    "#{names[0]}, #{names[1]} and #{names.size - 2} others like this"
  end
end

def likes(names)
  first_1, first_2, *rest = names
  return 'no one likes this' unless first_1
  return "#{first_1} likes this" unless first_2
  return "#{first_1} and #{first_2} like this" if rest.empty?
  return "#{first_1}, #{first_2} and #{rest.first} like this" if rest.size == 1
  return "#{first_1}, #{first_2} and #{rest.size} others like this"
end

p likes([])# 'no one likes this')
p likes(['Peter'])# 'Peter likes this')
p likes(['Jacob', 'Alex'])# 'Jacob and Alex like this')
p likes(['Max', 'John', 'Mark'])# 'Max, John and Mark like this')
p likes(['Alex', 'Jacob', 'Mark', 'Max'])# 'Alex, Jacob and 2 others like this')



