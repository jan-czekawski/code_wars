# Snail Sort

# Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#         [4,5,6],
#         [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]
# For better understanding, please follow the numbers of the next array consecutively:

# array = [[1,2,3],
#         [8,9,4],
#         [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]
# This image will illustrate things more clearly:

# check snail.png

# NOTE: The idea is not sort the elements from the lowest value to the highest; the idea is to traverse the 2-d array in a clockwise snailshell pattern.

# NOTE 2: The 0x0 (empty matrix) is represented as [[]]

# def find_outer(arr, x, y)
#   if arr[x].nil?
#     # rows have ended
#     find_outer(arr, x - 1, y)
#   else
#     if arr[x][y].nil?
#       find_outer(arr, x + 1, y - 1)
#     else

#     end
#   end
# end

# def snail(array)
#   result = Array.new
#   x, y = 0, 0
#   what = "add"
  
#   # while array.flatten.count(nil) < 5
#   40.times do |z|
#     if array[x].nil?
#       if what == "add"
#         x -= 1
#       else
#       end
#     else
#       if array[x][y].nil?
#         if y < 0
#           y += 1
#           x -= 1
#           what = "subtract"
#         else
#           y -= 1
#           x += 1
#         end
#         # if array[x][y - 1].nil?
#         # else
          
#         # end
#         # if !array[x][y+1].nil?
#         #   y += 1
#         #   x -= 1
#         # elsif !array[x][y-1].nil?
#         #   y -= 1
#         #   x += 1
#         # else
          
#         # end
#       else
#         result << array[x][y]
#         array[x][y] = nil
#         y += 1
#       end
#     end

#   end
  
#   result
# end

# arr[0][0], arr[0][1], arr[0][2], arr[1][2], arr[2][2], arr[2][1], arr[2][0], arr[1][0], arr[1][1]

# digit[0], digit[1], digit[2], digit[3],
# digit+1[3], digit+2[3], digit+3[3],
# digit+3[2], digit+3[1], digit+3[0],
# digit+2[0], digit+1[0],
# digit+1[1], digit+1[2]

def find_outer(x, y, array, result)
  start_x = x
  start_y = y

  until array[x].empty?
    result << array[x].shift
  end

  x += 1
  
  until array[x].nil? || array[x].empty?
    result << array[x].pop
    x += 1
  end
  
  x -= 1
  
  until array[x].empty?
    result << array[x].pop
  end

  x -= 1
  
  until array[x].empty?
    result << array[x].shift
    x -= 1
  end
  
  x, y = start_x, start_y
  return if array.flatten.empty?
  
  find_outer(x + 1, y + 1, array, result)
end

def snail(array)
  x, y = 0, 0
  result = Array.new
  
  find_outer(x, y, array, result)

  result
end

# BEST SOLUTIONS
def snail(array)
  # array.empty? ? [] : array.shift + snail(array.transpose.reverse)
  array.empty? ? [] : array[0] + snail(array[1..-1].transpose.reverse)
end


p snail([[1,2,3,1],
        [4,5,6,4],
        [7,8,9,7],
        [7,8,9,7]]) # , [1, 2, 3, 1, 4, 7, 7, 9, 8, 7, 7, 4, 5, 6, 9, 8]


# p snail([[1,2,3],
#         [4,5,6],
#         [7,8,9]]) # , [1, 2, 3, 6, 9, 8, 7, 4, 5]

p snail([[1,2,3],
        [8,9,4],
        [7,6,5]]) #=> [1,2,3,4,5,6,7,8,9]