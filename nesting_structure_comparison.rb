# Complete the method (or function in Python) to return true when its 
# argument is an array that has the same nesting structure as the first array.

# For example:

# # should return true
# [ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )

# # should return false 
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] )

# # should return true
# [ [ [ ], [ ] ] ].same_structure_as( [ [ [ ], [ ] ] ] ); 

# # should return false
# [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )
# For your convenience, there is already a function 'isArray(o)' 
# declared in the JS version that returns true if its argument is an array, false otherwise.


class Array
  
  def same_structure_as(arr)
    $same_structure = true
    
    return false unless arr.is_a?(Array)
    return false unless arr.size == self.size
    
    check_deeper(self, arr)
    $same_structure
  end

  private
  
  def check_deeper(arr_1, arr_2)
    if (arr_1.is_a?(Array) && arr_2.is_a?(Array)) && arr_1.size == arr_2.size
      arr_1.size.times do |x|
        check_deeper(arr_1[x], arr_2[x])  
      end
    else
      if arr_1.is_a?(Integer) || arr_2.is_a?(Integer)
        $same_structure = false if arr_1.is_a?(Array) || arr_1.is_a?(Array)
      else
        $same_structure = false unless arr_1.size == arr_2.size
      end
    end
  end
end


p [1,[1,1]].same_structure_as([2,[2,2]]) #"[1,[1,1]] same as [2,[2,2]]")
p ![1,[1,1]].same_structure_as([[2,2],2])# "[1,[1,1]] not same as [[2,2],2]")
p [1,[1,1]].same_structure_as([[2,2],2])# "[1,[1,1]] not same as [[2,2],2]")
p [1,'[',']'].same_structure_as(['[',']',1])