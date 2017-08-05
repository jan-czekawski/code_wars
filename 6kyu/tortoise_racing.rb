# Two tortoises named A and B must run a race. A starts with an 
# average speed of 720 feet per hour. Young B knows she runs faster
# than A and furthermore has not finished her cabbage.

# When she starts, at last, she can see that A has a 70 feet 
# lead but B speed is 850 feet per hour. How long will it take B to catch A?

# More generally: given two speeds v1 (A speed, integer > 0) 
# and v2 (B speed, integer > 0) and a lead g (integer > 0) how 
# long will it take B to catch A?

# The result will be an array [h, mn, s] where h, mn, s is the 
# time needed in hours, minutes and seconds (don't worry for fractions
# of second). If v1 >= v2 then return nil, nothing, null, None 
# or {-1, -1, -1} for C++, C, Go.

# Examples:

# race(720, 850, 70) => [0, 32, 18]
# race(80, 91, 37) => [3, 21, 49]
# Note: you can see some other examples in "Your test cases".

def race(v1, v2, g)
  return nil if v1 >= v2
  time_in_s = 0
  
  # v1_per_s, v2_per_s = [v1, v2].map(&(1/3600.0).method(:*))
  v1_per_s, v2_per_s = (v1 / 3600.0), (v2 / 3600.0)
  
  until (g + v1_per_s * time_in_s) <= (0 + v2_per_s * time_in_s)
    time_in_s += 1
  end
  p "g + v1_per_s * time_in_s=#{g + v1_per_s * time_in_s}"
  p "0 + v2_per_s * time_in_s=#{v2_per_s * time_in_s}"
  h = time_in_s / 3600
  mn = time_in_s % 3600 / 60 
  s = (time_in_s % 3600 % 60).zero? ? 0 : time_in_s % 3600 % 60 

  [h, mn, s]
end

p race(720, 850, 70)# [0, 32, 18])
p race(80, 91, 37)# [3, 21, 49])
p race(80, 100, 40)# [2, 0, 0])
p race(357, 757, 149)# [0, 22, 21])