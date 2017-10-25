# MY SOLUTION
def alphanumeric?(str)
  str.length > 0 && str.each_char { |ch| return false unless ch.match(/[[:alnum:]]/) }
end