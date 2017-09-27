# Find the number with the most digits.

# If two numbers in the argument array have the same number of digits,
# return the first one in the array.

# MY SOLUTION
def find_longest(arr)
  arr.max_by { |x| x.to_s.length }
end

# OTHER SOLUTIONS
def find_longest(arr)
  x = 0
  arr.each { |i| i.to_s.length > x.to_s.length ? x = i : x }
  
  x
end

def find_longest(arr)
  arr.max_by { |num| num.to_s.size }
end

def find_longest(arr)
  return d=arr.max {|a,b| a.to_s.length <=> b.to_s.length}
end

def find_longest(arr)
  num_count = arr.map { |x| x.to_s.size}
  arr[num_count.index(num_count.max)]
end

def find_longest(arr)
  arr.inject do |contender, x|
    if x.digit_length > contender.digit_length then
      x
    else
      contender
    end
  end
end

class Integer
  def digit_length
    self.to_s.length
  end
end

p find_longest([1, 10, 100])# 100)
p find_longest([9000, 8, 800])# 9000)
p find_longest([8, 900, 500])# 900)
p find_longest([3, 40000, 100])# 40000)
p find_longest([1, 200, 100000])# 100000)
