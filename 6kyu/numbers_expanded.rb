# Write Number in Expanded Form

# You will be given a number and you will need to return 
# it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# If you liked this kata, check out part 2!!

def expanded_form(num)
  size = num.to_s.size
  result = []
  i = 1
  while i < size
    rest = num % 10**i
    num -= rest
    result.unshift(rest)
    i += 1
  end
  result.unshift(num).delete(0)
  result.join(" + ")
end


p expanded_form(12)# '10 + 2')
p expanded_form(42)# '40 + 2')
p expanded_form(70304)# '70000 + 300 + 4')