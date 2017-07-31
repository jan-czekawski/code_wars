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

p likes([])# 'no one likes this')
p likes(['Peter'])# 'Peter likes this')
p likes(['Jacob', 'Alex'])# 'Jacob and Alex like this')
p likes(['Max', 'John', 'Mark'])# 'Max, John and Mark like this')
p likes(['Alex', 'Jacob', 'Mark', 'Max'])# 'Alex, Jacob and 2 others like this')



