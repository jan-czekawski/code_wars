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

# MY SOLUTION
def get_pins(observed)
  combos = {
    "1" => ["1", "2", "4"],
    "2" => ["1", "2", "3", "5"],
    "3" => ["2", "3", "6"],
    "4" => ["1", "4", "5", "7"],
    "5" => ["2", "4", "5", "6", "8"],
    "6" => ["3", "5", "6", "9"],
    "7" => ["4", "7", "8"],
    "8" => ["5", "7", "8", "9", "0"],
    "9" => ["6", "8", "9"],
    "0" => ["8", "0"]
  }
  arr_combos = observed.chars.map { |digit| combos[digit] }
  arr_all_combos = arr_combos[0].product(*arr_combos[1..arr_combos.size])
  # arr_all_combos = arr_combos[0].product(*arr_combos[1..-1])
  arr_all_combos.map { |item| item.join }
end

# BEST SOLUTIONS
def get_pins(digits)
  base_combos = {
    "1" => %w(1 2 4),
    "2" => %w(1 2 3 5),
    "3" => %w(2 3 6),
    "4" => %w(1 4 5 7),
    "5" => %w(2 4 5 6 8),
    "6" => %w(3 5 6 9),
    "7" => %w(4 7 8),
    "8" => %w(5 7 8 9 0),
    "9" => %w(6 8 9),
    "0" => %w(8 0)
  }
  digits.chars.map { |digit| base_combos[digit] }.reduce do |res, cur_item|
    res.product(cur_item).map(&:join)
  end
end

def get_pins(digits)
  combos = ["08 ", "124 ", "2135 ", "326 ", "4157 ", "52468 ", "6359 ", "748 ", "85790 ", "968 "]
  digits = digits.gsub(/(\d)/) { combos[$1.to_i] }.split.map(&:chars).map(&:to_a)
  digits.first.product(*digits.drop(1)).map(&:join)
end

p get_pins("8"), get_pins("11"), get_pins("369")
