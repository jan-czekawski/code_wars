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


# BEST SOLUTIONS
srand(1)
guess = 42


Kernel::srand(2)
guess = (Kernel::rand() * 100 + 1).floor
Kernel::srand(2)


guess = 

guess = 10
$lucky_number = 10


guess = Struct.new(:foobar) do 
  def self.==(x)
    true
  end
end

guess = ""
def guess.==(other) true end
  
  
  
module Kernel
def self.rand(max=0)
  return 0
end
end

guess = 1

#This is exactly what the real test fixture looks like.
lucky_number = (Kernel::rand() * 100 + 1).floor
p lucky_number == guess
# Test.assert_equals(guess, lucky_number, "Sorry. Unlucky this time.")