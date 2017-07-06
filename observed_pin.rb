# Alright, detective, one of our colleagues successfully observed our 
# target person, Robby the robber. We followed him to a secret warehouse, where we assume to find all the stolen stuff. The door to this warehouse is secured by an electronic combination lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby entered it.

# The keypad has the following layout:

# ┌───┬───┬───┐
# │ 1 │ 2 │ 3 │
# ├───┼───┼───┤
# │ 4 │ 5 │ 6 │
# ├───┼───┼───┤
# │ 7 │ 8 │ 9 │
# └───┼───┼───┘
#     │ 0 │
#     └───┘
# He noted the PIN 1357, but he also said, it is possible that each of 
# the digits he saw could actually be another adjacent digit (horizontally 
# or vertically, but not diagonally). E.g. instead of the 1 it could also 
# be the 2 or 4. And instead of the 5 it could also be the 2, 4, 6 or 8.

# He also mentioned, he knows this kind of locks. You can enter an unlimited
# amount of wrong PINs, they never finally lock the system or sound the alarm.
# That's why we can try out all possible (*) variations.

# * possible in sense of: the observed PIN itself and all variations considering
# the adjacent digits

# Can you help us to find all those variations? It would be nice to have a 
# function,
# that returns an array of all variations for an observed PIN with a 
# length of 1 to 8 digits. We could name the function getPINs (get_pins in python).
# But please note that all PINs, the observed one and also the results, 
# must be strings, because of potentially leading '0's. We already prepared 
# some test cases for you.

# Detective, we count on you!


# MY SOLUTION => NOT RESOLVED !!!!
# def get_pins(observed)
#   results = []
#   new_results = []
#   temp_results = []
#   comb_hash = {
#     "1" => ["1", "2", "4"],
#     "2" => ["1", "2", "3", "5"],
#     "3" => ["2", "3", "6"],
#     "4" => ["1", "4", "5", "7"],
#     "5" => ["2", "4", "5", "6", "8"],
#     "6" => ["3", "5", "6", "9"],
#     "7" => ["4", "7", "8"],
#     "8" => ["5", "7", "8", "9", "0"],
#     "9" => ["6", "8", "9"],
#     "0" => ["8", "0"]
#   }
#   observed.split("").each do |char|
#     results << comb_hash[char]
#   end
#   p results

#   # max x = 8
#   # max y = 5

#   results.each_with_index do |one_combo, idx|
#     one_combo.each_with_index do |digit, i|
#       unless results[idx + 1].nil?
#         results[idx + 1].each do |second_combo|
#           if temp_results.empty?
#             temp_results[0] = one_combo[i]
#           elsif temp_results[0].size == results.size
#             new_results << temp_results
#             temp_results = []
#           else
#             temp_results[0] += second_combo
#           end
#         end
#       end
#     end
#   end

#   new_results.flatten
#   # 5.times do |y|
#   #   observed.size.times do |x|
#   #     unless results[x].nil?
#   #       unless results[x][y].nil?
#   #         temp_results << results[x][y]
#   #       else
#   #         new_results << temp_results.join
#   #         temp_results = []
#   #       end
#   #     end
#   #   end
#   # end


#   # FIRST CHECK IF RESULT[X] exist
#   # check if result[0][0]
#   # check if result[1][0]
#   # check if result[2][0]
#   # check if result[3][0]
#   # check if result[4][0] == NIL => ADD ONLY 4 ELEMENTS

#   # if result[0][0] not nil
#   #   if result[1][0] not nil
#   #     if result[2][0] not nil
#   #       if result[3][0] not nil
#   #     else
#   #       new_results << results[0][0] + results[1][0]
#   #       new_results << results[0][0] + results[1][1]
#   #       new_results << results[0][0] + results[1][2]
#   #       new_results << results[0][0] + results[1][3]
#   #       new_results << results[0][0] + results[1][4]
#   #       new_results << results[0][1] + results[1][0]
#   #     end
#   #   else
#   #     new_results << results[0][0]
#   #     new_results << results[0][1]
#   #     new_results << results[0][2]
#   #     new_results << results[0][3]
#   #   end  
#   # end  
  
  
#   # new_results << results[0][0] + results[1][0] + results[2][0] + results[3][0]
#   # new_results << results[0][0] + results[1][0] + results[2][0] + results[3][1]
#   # new_results << results[0][0] + results[1][0] + results[2][0] + results[3][2]
#   # new_results << results[0][0] + results[1][0] + results[2][0] + results[3][3]
#   # new_results << results[0][0] + results[1][0] + results[2][1] + results[3][0]
#   # new_results << results[0][0] + results[1][0] + results[2][1] + results[3][1]
#   # new_results << results[0][0] + results[1][0] + results[2][1] + results[3][2]
#   # new_results << results[0][0] + results[1][0] + results[2][1] + results[3][3]
#   # new_results << results[0][0] + results[1][0] + results[2][2] + results[3][0]
#   # new_results << results[0][0] + results[1][0] + results[2][2] + results[3][1]
#   # new_results << results[0][0] + results[1][0] + results[2][2] + results[3][2]
#   # new_results << results[0][0] + results[1][0] + results[2][2] + results[3][3]
#   # new_results << results[0][0] + results[1][1] + results[2][0] + results[3][0]
#   # new_results.uniq

#   # x = 0
#   # until results[x].nil?
#   #   y = 0
#   #   until results[x][y].nil?
#   #     unless results[x + 1].nil?
#   #       unless results[x + 1][y + 1].nil?
          
#   #       end
#   #     end
#   #     y += 1
#   #   end
#   #   x += 1
#   # end
  
#   # iterate through elements from the results[0] with elements from results[1]
#   # add results[0][0] to results[1][0], add results[0][0] to results[1][1] ...
#   # results.size.times do |x|
#   #   # print "x = #{x} "
#   #   results[x].size.times do |y|
#   #   # print "x = #{x}, y = #{y} ** "
#   #     results[x].each do |char_x|
#   #       # print "char_x = #{char_x} ** "
#   #       unless results[x + 1].nil?
#   #         results[x + 1].each do |char_y|
#   #           new_results << (char_x + char_y)
#   #         end
#   #       else
#   #       end
#   #     end
#   #   end
#   # end
  
  
#       # temp_results.each do |item|
#     #   new_results[x] = item if new_results[x].nil?
#     #   new_results[x] += item unless new_results[x].nil?
#     # end
#     # temp_results = []
    
  
#   # results => array with n-times elements (n - digits)
#   # 1-digit pin => 1 element, 2-digit pin => 2 elements etc
#   # results


#   # new_results = results.flatten if new_results.empty?
# end

# BEST SOLUTION
def get_pins(observed)
  nums = {
    "0" => ["0", "8"],
    "1" => ["1", "2", "4"],
    "2" => ["1", "2", "3", "5"],
    "3" => ["2", "3", "6"],
    "4" => ["1", "4", "7", "5"],
    "5" => ["2", "5", "8", "4", "6"],
    "6" => ["3", "6", "9", "5"],
    "7" => ["4", "7", "8"],
    "8" => ["0", "5", "7", "8", "9"],
    "9" => ["6", "8", "9"]
  }
  digits, ret = Array.new, Array.new
  observed.chars.each { |e| digits.push(nums[e]) }
  # "18"
  # ["1", "8"].each
  # digits.push(nums["1")
  # digits.push(nums["8")
  
  products = digits[0].product(*digits[1..digits.length])
  products.each { |e| ret.push(e.join) }
  ret.sort
end

# p get_pins("8"), get_pins("11"), get_pins("121"), get_pins("3212")
p get_pins("11")

# a = [1, 2, 3, 4, 5, 5, nil, nil]
# b = [6, 4, 5]

# def change(arr)
# end

# p a[0..a.size-1]
  
