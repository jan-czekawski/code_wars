# You live in the city of Cartesia where all roads are laid out in 
# a perfect grid. You arrived ten minutes too early to an appointment,
# so you decided to take the opportunity to go for a short walk. 
# The city provides its citizens with a Walk Generating App on 
# their phones -- everytime you press the button it sends you 
# an array of one-letter strings representing directions to walk
# (eg. ['n', 's', 'w', 'e']). You know it takes you one minute
# to traverse one city block, so create a function that will return
# true if the walk the app gives you will take you exactly ten 
# minutes (you don't want to be early or late!) and will, of course, 
# return you to your starting point. Return false otherwise.

# Note: you will always receive a valid array containing a random
# assortment of direction letters ('n', 's', 'e', or 'w' only). It
# will never give you an empty array (that's not a walk, that's 
# standing still!).

# MY SOLUTION
def isValidWalk1(walk)
  return false unless walk.size == 10
  start = [0, 0]
  walk.each do |dir|
    case dir
    when "n" then start[1] += 1
    when "s" then start[1] -= 1
    when "e" then start[0] += 1
    when "w" then start[0] -= 1
    end
  end
  start == [0, 0]
end

# BEST SOLUTION
def isValidWalk2(walk)
  walk.count('w') == walk.count('e') and
  walk.count('n') == walk.count('s') and
  walk.count == 10
end

def isValidWalk(walk)
return false unless walk.size == 10
sum = 0
  walk.each do |d|
    case d
      when 'n' then sum += 1
      when 's' then sum -= 1
      when 'e' then sum += 2
      when 'w' then sum -= 2
    end
  end
  if sum == 0
    true
  else
    false
  end
end

def isValidWalk2(walk)  
  if walk.length != 10
    return false
  end
  
  xsum = 0
  ysum = 0
  
  walk.each do |direction|
    case direction
    when 'n'
      ysum += 1
    when 's'
      ysum -= 1
    when 'e'
      xsum += 1
    when 'w'
      xsum -= 1
    end
  end
  
  xsum == 0 and ysum == 0
  
end

p isValidWalk(['n','s','n','s','n','s','n','s','n','s'])# 'should return true');
p isValidWalk(['w','e','w','e','w','e','w','e','w','e','w','e'])# 'should return false');
p isValidWalk(['w'])# 'should return false');
p isValidWalk(['n','n','n','s','n','s','n','s','n','s'])# 'should return false');
