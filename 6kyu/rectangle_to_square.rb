# The drawing below gives an idea of how to cut a given "true" 
# rectangle into squares ("true" rectangle meaning that the two
# dimensions are different).

# alternative text

# Can you translate this drawing into an algorithm?

# You will be given two dimensions

# a positive integer length (parameter named lng)
# a positive integer width (parameter named wdth)
# You will return an array with the size of each of the squares.

#   sqInRect(5, 3) should return [3, 2, 1, 1]
#   sqInRect(3, 5) should return [3, 2, 1, 1]
# #Note: lng == wdth as a starting case would be an entirely 
# different problem and the drawing is planned to be interpreted
# with lng != wdth. See kata, Square into Squares. Protect trees!.

# When the initial parameters are so that lng == wdth, the solution
# [lng] would be the most obvious but not in the spirit of this kata
# so, in that case, return None/nil/null/Nothing. Return {} with C++.

# In that case the returned structure of C will have its sz component
# equal to 0. (See the "Solution" and "Examples" tabs)

#   sqInRect(5, 5) should return nil

# def sqInRect(lng, wdth)
#   return nil if lng == wdth
#   field = lng * wdth
#   squares = []
#   while field > 0
#     root = Math.sqrt(field)
#     if (1..3).include?(field)
#       squares << 1
#       field -= 1
#     elsif root % 1 == 0
#       p "sum=" + squares.inject(0) { |sum, num| sum + num**2 }.to_s
#       p "field= " + field.to_s
#       squares << root.to_i
#       field -= root.to_i
#     else
#       field -= 1
#     end
#   end
#   squares
# end

# MY SOLUTION
def sqInRect(lng, wdth)
  return nil if lng == wdth
  squares = []
  
  while true
    if lng > wdth
      squares << wdth
      lng -= wdth
    elsif lng < wdth
      squares << lng
      wdth -= lng
    else
      squares << lng
      return squares
    end
  end
end

# BEST SOLUTIONS
def sqInRect(l, w)
    rects = []
    while l>0 do
      w,l = [w,l].minmax
      rects << w
      l -= w
    end
    rects.size > 1 ? rects : nil
end

def sqInRect(lng, wdth, nil_if_same = true)
  return nil if lng == wdth && nil_if_same
  
  return [] if lng == 0 || wdth == 0
  
  min, max = [lng, wdth].minmax
  
  [min] + sqInRect(min, max - min, false)
end

def sqInRect(lng, wdth)
    if lng == wdth then return nil end
    if lng < wdth then wdth, lng = lng, wdth end
    res = []
    while lng != wdth do
        res << wdth
        lng = lng - wdth
        if lng < wdth then wdth, lng = lng, wdth end
    end
    res << wdth
    res
end

p sqInRect(5, 5)# nil)
p sqInRect(5, 3)# [3, 2, 1, 1])
p sqInRect(20, 14)# [14, 6, 6, 2, 2, 2])
