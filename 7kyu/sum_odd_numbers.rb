# Given the triangle of consecutive odd numbers:

#             1
#           3     5
#       7     9    11
#   13    15    17    19
# 21    23    25    27    29
# ...
# Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:

# row_sum_odd_numbers(1); # 1
# row_sum_odd_numbers(2); # 3 + 5 = 8

# MY SOLUTION
def row_sum_odd_numbers(n)
  # (1..n).each_with_object([]) { |row, obj| obj <<  }
  #       .at(n - 1)
  # arr = Array.new(n, 0)
  # num = 1
  # n.times do |x|
    
  #   arr[x] += num
  #   num += 2
  # end
  # arr
  min = n * (n - 1) + 1
  max = n * n + (n - 1)
  (min..max).reject(&:even?).inject(:+)
end

# BEST SOLUTION
def row_sum_odd_numbers(n)
  n**3
end

def row_sum_odd_numbers(n)
  arr = []
  idx0 = 0
  while idx0 < n
  	arr.empty? ? idx1 = 0 : idx1 = arr[-1] + 2
  	arr = []
  	while arr.size < idx0 + 1
  		arr << idx1 if idx1.odd?
  		idx1 += 1
  	end
  	idx0 += 1
  end
  
  arr.inject(:+)
end

def row_sum_odd_numbers(n)
 size = n.downto(0).reduce(:+)
 num = 1
 oddz = [1]
 
 size.times do
   oddz << num+=2
 end
 
 return oddz[-n-1...-1].inject(:+)
end

def row_sum_odd_numbers(n)
  a = n*(n-1) + 1   
  b = a + (n-1) * 2
  n * (a + b)/2
end

p row_sum_odd_numbers(1) # 1)
p row_sum_odd_numbers(2) # 8)
p row_sum_odd_numbers(13) # 2197)
p row_sum_odd_numbers(19) # 6859)
p row_sum_odd_numbers(41) # 68921)
