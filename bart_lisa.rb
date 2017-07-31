# Given: an array containing hashes of names

# Return: a string formatted as a list of names separated by 
# commas except for the last two names, which should be 
# separated by an ampersand.

# Example:

# list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# # returns 'Bart, Lisa & Maggie'

# list([ {name: 'Bart'}, {name: 'Lisa'} ])
# # returns 'Bart & Lisa'

# list([ {name: 'Bart'} ])
# # returns 'Bart'

# list([])
# # returns ''
# Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

# MY SOLUTIONS
def list(names)
  first_arr = names.map(&:to_a)
  last_arr = first_arr.slice!(-2, 2)
  first_arr = first_arr.map { |nm| nm[0][1] }.join(", ")
  last_arr = last_arr.map { |nm| nm[0][1] }.join(" & ") unless last_arr.nil?
  last_arr.prepend(", ") unless first_arr.empty? || last_arr.nil?
  "#{first_arr}#{last_arr}"
end

def list(names)
  first_arr = names.map { |name| name[:name] }
  last_arr = first_arr.slice!(-2, 2)
  first_arr = first_arr.join(", ")
  last_arr = last_arr.join(" & ") unless last_arr.nil?
  last_arr.prepend(", ") unless first_arr.empty? || last_arr.nil?
  "#{first_arr}#{last_arr}"
end

def list(names)
  names_arr = names.map { |name| name[:name] }
  return names_arr[0] if names_arr.size < 2
  first_arr = names_arr[0..-3].join(", ")
  last_arr =  names_arr[-2..-1].join(" & ")
  last_arr.prepend(", ") unless first_arr.empty?
  first_arr + last_arr
end

def list(names)
  names.map(&:values)
end

# BEST SOLUTIONS
# def list names
#   names = names.map { |name| name[:name] }
#   last_name = names.pop
#   return last_name.to_s if names.empty?
#   "#{names.join(', ')} & #{last_name}"
# end

# def list names
#   names.map(&:values).join(', ').gsub(/, (\w+)$/, ' & \1')
# end

def list names
  names.map { |x| x[:name] }.join(', ').sub(/(.*)(, )(.*)/, '\1 & \3')
end

def list names
  return '' if names.empty?
  last = names.length != 1 ? " & #{names.pop[:name]}" : ""
  names.map!{|hash| hash[:name]}.join(', ') + last
end

def list names
  out = ''
  while names.size > 2
    out << names.shift[:name] << ', '
  end
  out << names.shift[:name] if names.size > 0
  out << ' & ' << names.shift[:name] if names.size == 1
  out
end

def list names
  ret = ""
  until names.length == 0
    if names.length >= 3
      ret << names.shift[:name] + ", "
    elsif names.length == 2
      ret << names.shift[:name] + " & "
    else
      ret << names.shift[:name]
    end
  end
  ret
end

def list names
  names.map(&:values).flatten.each_slice(names.size > 1 ? names.size - 1 : 1).map{|n| n.join(', ')}.join(' & ')
end

p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}])# 'Bart, Lisa, Maggie, Homer & Marge',
# "Must work with many names")
p list([{name: 'Bart'},{name: 'Lisa'}])# 'Bart & Lisa', 
# "Must work with two names")
p list([{name: 'Bart'}])# 'Bart', "Wrong output for a single name")