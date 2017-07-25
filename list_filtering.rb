# In this kata you will create a function that takes a list of non-negative 
# integers and strings and returns a new list with the strings filtered out.

# Example

# filter_list([1,2,'a','b']) == [1,2]
# filter_list([1,'a','b',0,15]) == [1,0,15]
# filter_list([1,2,'aasf','1','123',123]) == [1,2,123]

# MY SOLUTION
def filter_list(l)
  l.reject { |el| el.is_a?(String) }
end


# CLEVER SOLUTIONS
def filter_list(l)
# l.grep(Numeric)
 l.grep_v(String)
end

def filter_list(l)
  # l.select {  |e| e.respond_to?("abs") }
  # l.reject {  |e| !e.respond_to?("abs") }
  l.reject {  |e| !e.respond_to?(:abs) }
end

p filter_list([1,2,'a','b'])#[1,2])
p filter_list([1,'a','b',0,15])#[1,0,15])
p filter_list([1,2,'aasf','1','123',123])#[1,2,123])
