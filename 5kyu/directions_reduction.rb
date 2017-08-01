# Once upon a time, on a way through the old wild west,…

# … a man was given directions to go from one point to another. 
# The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" 
# and "SOUTH" are opposite, "WEST" and "EAST" too. Going to one direction 
# and coming back the opposite direction is a needless effort. Since this
# is the wild west, with dreadfull weather and not much water, it's 
# important to save yourself some energy, otherwise you might die of thirst!

# How I crossed the desert the smart way.

# The directions given to the man are, for example, the following:

# ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
# or

# { "NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST" };
# or (haskell)

# [North, South, South, East, West, North, West]
# You can immediatly see that going "NORTH" and then "SOUTH" is not
# reasonable, better stay to the same place! So the task is to give
# to the man a simplified version of the plan. A better plan in this
# case is simply:

# ["WEST"]
# or

# { "WEST" }
# or (haskell)

# [West]
# or (rust)

# [WEST];
# Other examples:

# In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH"
# is going north and coming back right away. What a waste of time! Better to do nothing.

# The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate
# each other, therefore, the final result is [] (nil in Clojure).

# In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and 
# "SOUTH" are not directly opposite but they become directly opposite 
# after the reduction of "EAST" and "WEST" so the whole path is reducible
# to ["WEST", "WEST"].

# Task

# Write a function dirReduc which will take an array of strings and
# returns an array of strings with the needless directions removed
# (W<->E or S<->N side by side).

# The Haskell version takes a list of directions with data Direction =
# North | East | West | South. The Clojure version returns nil when
# the path is reduced to nothing. The Rust version takes a slice of
# enum Direction {NORTH, SOUTH, EAST, WEST}.

# Examples

# dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]) => ["WEST"]
# dirReduc(["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH"]) => []
# See more examples in "Example Tests"

# Note

# Not all paths can be made simpler. The path ["NORTH", "WEST",
# "SOUTH", "EAST"] is not reducible. "NORTH" and "WEST", "WEST" and
# "SOUTH", "SOUTH" and "EAST" are not directly opposite of each other
# and can't become such. Hence the result path is itself : ["NORTH", "WEST", "SOUTH", "EAST"].

# MY SOLUTION
def dirReduc(arr)
  dir = { "NORTH" => "SOUTH", "SOUTH" => "NORTH", "WEST" => "EAST", "EAST" => "WEST" }
  result = arr
  i = 0
  while i < result.size
    if result[i+1] == dir[result[i]]
      result.slice!(i, 2)
      i = 0
      redo
    end
    i += 1
  end
  result
end

def check_before(index, array, dir)
  if index >= 1
    if array[index-1] == dir[array[index]]
      array.slice!(index - 1, 2)
      check_before(index - 2, array, dir)
    else
      check_next(index, array, dir)
    end
  else
    check_next(index, array, dir)
  end
end

def check_next(index, array, dir)
  if index + 1 < array.size
    if array[index+1] == dir[array[index]]
      array.slice!(index, 2)
      check_before(index, array, dir)
    else
    end
  else
    array
  end
end

def dirReduc(arr)
  dir = { "NORTH" => "SOUTH", "SOUTH" => "NORTH", "WEST" => "EAST", "EAST" => "WEST" }
  result = arr
  i = 0
  while i < result.size
    check_before(i, result, dir)
    check_next(i, result, dir)
    i += 1
  end
  result
end

OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReduc(arr)
  stack = []
  arr.each do |dir|
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
  stack
end

def dirReduc(arr)
  arr = arr.join(' ')
  nil while arr.gsub!(/ ?NORTH SOUTH ?/, ' ') or 
            arr.gsub!(/ ?SOUTH NORTH ?/, ' ') or 
            arr.gsub!(/ ?WEST EAST ?/, ' ') or 
            arr.gsub!(/ ?EAST WEST ?/, ' ')
  arr.strip.split(/ +/)
end

def dirReduc(arr)
    opposite = lambda do |dir|
        if (dir == "NORTH") then rep = "SOUTH"
        elsif (dir == "SOUTH") then rep = "NORTH"
        elsif (dir == "EAST") then rep = "WEST"
        elsif (dir == "WEST") then rep = "EAST"
        else rep = ""
        end
        rep
    end
    res = []
    if (arr.length > 0) then
        if (arr.length > 1) then
            if (arr[0] == opposite.call(arr[1])) then
                res = dirReduc(arr[2..-1])
            else
                res << arr[0]
                res << dirReduc(arr[1..-1])
            end
        else
            res << arr
        end
    else
        res << []
    end
    res = res.flatten
    if (res == arr) then return arr
    else res = dirReduc(res) end
    res
end

def dirReduc(arr)  
  arr.each_with_object([]) do |direction, object|
    case [direction, object.last.to_s].sort.join
      when "NORTHSOUTH", "EASTWEST"
        object.pop
      else
        object << direction     
    end
  end
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(a) #, ["WEST"])
u=["NORTH", "WEST", "SOUTH", "EAST"]
p dirReduc(u) #, ["NORTH", "WEST", "SOUTH", "EAST"])