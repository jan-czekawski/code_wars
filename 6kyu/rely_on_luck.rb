# The test fixture I use for this kata is pre-populated.

# It will compare your guess to a random number generated using:

# (Kernel::rand() * 100 + 1).floor
# You can pass by relying on luck or skill but try not to rely on luck.

# "The power to define the situation is the ultimate power." - Jerry Rubin

# Good luck!


# MY SOLUTION
guess = 10

class Float
  def floor
    10
  end
end

#This is exactly what the real test fixture looks like.
lucky_number = (Kernel::rand() * 100 + 1).floor
p lucky_number == guess
# Test.assert_equals(guess, lucky_number, "Sorry. Unlucky this time.")