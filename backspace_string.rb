# Assume '#' is like backspace in string. This means 
# that string "a#bc#d" actually is "bd"

# "abc#d##c" is "ac"

# "abc##d######" is ""

# "######" is ""

# "" is ""

# Your task is to process string with '#' symbols


# MY SOLUTION
def clean_string(string)
  return string if string.count("#") == 0
  
  arr = string.chars
  until arr.count("#") == 0
    arr.each_with_index do |let, ix|
      if let == "#"
        if ix - 1 >= 0
          arr.slice!(ix-1,2)
        else
          arr.slice!(ix)
        end
        break
      end
    end
  end
  arr.join
end


p clean_string('abc#d##c') #, "ac")
p clean_string('abc####d##c#')# , "" )
p clean_string('#######6+yqw8hfklsd=-f')# , "" )
p clean_string("######") # is ""
p clean_string("") # "" is ""