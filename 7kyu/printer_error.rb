# In a factory a printer prints labels for boxes. For one kind of boxes the 
# printer has to use colors which, for the sake of simplicity, are named with letters from a to m.

# The colors used by the printer are recorded in a control string. 
# For example a "good" control string would be aaabbbbhaijjjm meaning 
# that the printer used three times color a, four times color b, one
# time color h then one time color a...

# Sometimes there are problems: lack of colors, technical malfunction 
# and a "bad" control string is produced e.g. aaaxbbbbyyhwawiwjjjwwm.

# You have to write a function printer_error which given a string will 
# output the error rate of the printer as a string representing a rational
# whose numerator is the number of errors and the denominator the length
# of the control string. Don't reduce this fraction to a simpler expression.

# The string has a length greater or equal to one and contains only letters from ato z.

# #Examples:

# s="aaabbbbhaijjjm"
# error_printer(s) => "0/14"

# s="aaaxbbbbyyhwawiwjjjwwm"
# error_printer(s) => "8/22"
# FUNDAMENTALS

# MY SOLUTION
def printer_error(s)
  "#{s.scan(/[n-z]/).size}/#{s.size}"
end

# BEST SOLUTIONS
def printer_error(s)
  "#{s.count('n-z')}/#{s.length}"
end


def printer_error(s)
	colors = s.chars
	total = colors.length
	errors = 0

	colors.each do |color|
	 	errors += 1 if ('n'..'z').cover?(color)
 	end
 	errors.to_s + '/' + total.to_s
end

def printer_error(s)
  errors = []
  total = s.length
  
  s.each_char do |x|
    errors << x if x.between?("n", "z")
  end 
  
  errors.length.to_s + "/" + total.to_s
end

def printer_error(s)
  (s.delete("a-m").length).to_s + "/" + (s.length).to_s
end

s="aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"
p printer_error(s)#, "3/56")

s="aaabbbbhaijjjm"
p printer_error(s)# => "0/14"

s="aaaxbbbbyyhwawiwjjjwwm"
p printer_error(s)# => "8/22"