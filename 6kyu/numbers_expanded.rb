# Write Number in Expanded Form

# You will be given a number and you will need to return 
# it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

# If you liked this kata, check out part 2!!

# MY SOLUTION
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

# BEST SOLUTION
def expanded_form(num)
  res = []
  len = num.abs.to_s.length
  num.to_s.chars.each_with_index{|d, i| (res << d + '0' * (len - i - 1)) if d != '0'}
  res.join(' + ')
end

def expanded_form(num)
  num.to_s
     .chars
     .reverse
     .map.with_index { |d, idx| d.to_i * 10**idx }
     .reject(&:zero?)
     .reverse
     .join (' + ')
end

def expanded_form(num)
  ans = num.to_s.chars.map.with_index {|n, i| n + ("0" * (num.to_s.chars.slice(i..-1).length - 1))}
  ans.select {|n| n.to_i > 0}.join(" + ")
end

def expanded_form(num)
  num_arr = num.to_s.split('')
  tick = '1'
  new_arr = []
  num_arr.reverse.each do |num|
    unless num == '0'
      new_arr << (num.to_i * tick.to_i).to_s
    end
    tick << '0'
  end 
  new_arr.reverse.join(' + ')
end

def expanded_form(num)
  arr = num.to_s.chars
  s = ''
  arr.each_with_index do |a, index|
    s << "#{a.to_i * (10 ** (arr.length - index - 1))} + " if a.to_i > 0
  end
  s[0,s.length - 3]
end

p expanded_form(12)# '10 + 2')
p expanded_form(42)# '40 + 2')
p expanded_form(70304)# '70000 + 300 + 4')