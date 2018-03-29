# In this kata, you will write a func that returns the positions 
# and the values of the "peaks" (or local maxima) of a numeric array.

# For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak in 
# position 3 with a value of 5 (arr[3] equals 5).

# The output will be returned as a struct (PosPeaks) with two 
# properties: Pos and Peaks. Both of these properties should be arrays.
# If there is no peak in the given array, then the output should be {Pos: [], Peaks: []}.

# Example: PickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) returns {Pos: [3, 7], Peaks: [6, 3]}

# All input arrays will be valid numeric arrays (although it could
# still be empty), so you won't need to validate the input.

# The first and last elements of the array will not be considered as
# peaks (in the context of a mathematical function, we don't know what
# is after and before and therefore, we don't know if it is a peak or not).

# Also, beware of plateaus! [1, 2 , 2 , 2 , 1] has a peak 
# while [1, 2, 2, 2, 3] does not. In case of a plateau-peak, please only 
# return the position and value of the beginning of the plateau. 
# For example: PickPeaks([1, 2, 2, 2, 1]) returns {Pos: [1], Peaks: [2]}

# Have fun!


# MY SOLUTION
def pick_peaks(arr)
  result = { "pos" => [], "peaks" => []}
  
  1.upto(arr.size - 2) do |x|
    if arr[x] > arr[x - 1] && arr[x] >= arr[x + 1]
      if arr[x] == arr[x + 1]
        # if !arr[x + 2].nil? && arr[x + 1] > arr[x + 2]
        #   result["pos"].push(x)
        #   result["peaks"].push(arr[x])
        # elsif !arr[x + 2].nil? && arr[x + 1] < arr[x + 2]
        # else
        #   if !arr[x + 3].nil? && arr[x + 2] > arr[x + 3]
        #     result["pos"].push(x)
        #     result["peaks"].push(arr[x])
        #   elsif !arr[x + 3].nil? && arr[x + 2] < arr[x + 3]
        #   else
        #     if !arr[x + 4].nil? && arr[x + 3] > arr[x + 4]
        #       result["pos"].push(x)
        #       result["peaks"].push(arr[x])
        #     elsif !arr[x + 4].nil? && arr[x + 3] < arr[x + 4]
        #     else
        #       if !arr[x + 5].nil? && arr[x + 4] > arr[x + 5]
        #         result["pos"].push(x)
        #         result["peaks"].push(arr[x])
        #       elsif !arr[x + 5].nil? && arr[x + 4] < arr[x + 5]
        #       else
        #       end
        #     end
        #   end
        # end
        y = x + 1
        until arr[y + 1].nil?
          if arr[y] > arr[y + 1]
            result["pos"].push(x)
            result["peaks"].push(arr[x])
            break
          elsif arr[y] < arr[y + 1]
            break
          end
          y += 1
        end
      else
        result["pos"].push(x)
        result["peaks"].push(arr[x])
      end
    end
  end
  result
end

# BEST SOLUTIONS
def pick_peaks(array)
  pos = []
  peak = nil
  (1...array.size).each do |index|
    if array[index] > array[index-1]
      peak = index
    elsif array[index] < array[index-1] && peak
      pos << peak
      peak = nil
    end
  end

  { "pos" => pos, "peaks" => pos.map { |p| array[p] } }
end

def pick_peaks(arr)
  pos, peaks = (1..arr.size-2).inject([[], []]) do |(p, v), i|
    next [p, v] unless arr[i] > arr[i-1]
    next_diff = (i+1..arr.size-1).find{|j| arr[i] != arr[j]}
    next [p, v] unless next_diff && arr[i] > arr[next_diff]
    [p << i, v << arr[i]]
  end
  {'pos'=>pos, 'peaks'=>peaks}
end

p pick_peaks([1,2,3,6,4,1,2,3,2,1]) #, {"pos"=>[3,7], "peaks"=>[6,3]})

p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) #, {"pos"=>[3,7], "peaks"=>[6,3]})

p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) #, {"pos"=>[3,7,10], "peaks"=>[6,3,2]})

p pick_peaks([2,1,3,1,2,2,2,2,1]) #, {"pos"=>[2,4], "peaks"=>[3,2]})

p pick_peaks([2,1,3,1,2,2,2,2]) # {"pos"=>[2], "peaks"=>[3]})


p pick_peaks([8, 2, 17, -5, 6, 7, 0, 18, 18, 1, -2, 18, 17, 8, 18, 20, 11, 6, 19])
# {"pos"=>[2, 5, 7, 11, 15], "peaks"=>[17, 7, 18, 18, 20]}

p pick_peaks([5, 11, 7, 9, 10, 9, 4, 19, 6, 14, -4, 16, 5, 11, 11, 13, -1, 7, 17, 3, 16, 2, -1])
# {"pos"=>[1, 4, 7, 9, 11, 15, 18, 20], "peaks"=>[11, 10, 19, 14, 16, 13, 17, 16]}