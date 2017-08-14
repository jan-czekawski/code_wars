# A child plays with a ball on the nth floor of a big building. 
# The height of this floor is known:

# (float parameter "h" in meters, h > 0) .

# He lets out the ball. The ball rebounds for example to two-thirds:

# (float parameter "bounce", 0 < bounce < 1)

# of its height.

# His mother looks out of a window that is 1.5 meters from the ground:

# (float parameters window < h).

# How many times will the mother see the ball either falling 
# or bouncing in front of the window

# (return a positive integer unless conditions are not fulfilled
# in which case return -1) ?

# Note

# You will admit that the ball can only be seen if the height
# of the rebouncing ball is stricty greater than the window parameter.

# Example:

# h = 3, bounce = 0.66, window = 1.5, result is 3

# h = 3, bounce = 1, window = 1.5, result is -1

# MY SOLUTION
def bouncingBall(h, bounce, window)
  return -1 if bounce >= 1 || bounce < 0 || window >= h
  count = 0
  while h > window
    h *= bounce
    count += 2
  end
  count - 1
end

# BEST SOLUTION
def bouncingBall(h, bounce, window)
  bounce > 0 && bounce < 1 && window < h ? 1 + 2*Math.log(window.to_f/h,bounce).floor : -1
end

def bouncingBall(start, decay, threshold)
  return -1 if decay >= 1 || decay < 0 || start <= threshold
  return 1 + (Math.log(threshold.to_f / start) / Math.log(decay)).floor * 2
end

def bouncingBall(h, bounce, window)
  bounce < 0 || bounce >= 1 || h <= window || window < 0 ? -1 : bouncingBall4(h * bounce, bounce, window) + 2
end

# p bouncingBall(3, 0.66, 1.5)#, 3)
# p bouncingBall(30, 0.66, 1.5)#, 15)

# require "benchmark"
# n = 100_000
# Benchmark.bm do |x|
#   x.report { n.times { bouncingBall1(30, 0.99, 1.5)  } }
#   x.report { n.times { bouncingBall2(30, 0.99, 1.5)  } }
#   x.report { n.times { bouncingBall3(30, 0.99, 1.5)  } }
#   x.report { n.times { bouncingBall4(30, 0.99, 1.5)  } }
# end