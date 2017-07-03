# You might know some pretty large perfect squares. But what about the NEXT one?

# Complete the findNextSquare method that finds the next integral perfect square
# after the one passed as a parameter. Recall that an integral perfect square is
# an integer n such that sqrt(n) is also an integer.

# If the parameter is itself not a perfect square, than -1 should be returned.
# You may assume the parameter is positive.

# Examples:

# findNextSquare(121) --> returns 144
# findNextSquare(625) --> returns 676
# findNextSquare(114) --> returns -1 since 114 is not a perfect

# MY SOLUTION
def find_next_square(sq)
  if (sq**0.5).to_i == sq**0.5
    loop do
      sq += 1
      return sq if (sq**0.5).to_i == sq**0.5
    end
  else
    -1
  end
  
  # is_square = -> (n) { (n**0.5).to_i == n**0.5 }
  # if is_square[sq]
  #   loop do
  #     sq += 1
  #     return sq if is_square[sq]
  #   end
  # else
  #   -1
  # end
end

# BEST SOLUTIONS
def find_next_square(sq)
  number = Math.sqrt(sq) + 1
  number % 1 == 0 ? number**2 : -1
end

def find_next_square(sq)
  is_square = -> (n) { Math.sqrt(n) % 1 == 0 }
  # is_square = lambda { |n| Math.sqrt(n) % 1 == 0 }
  is_square[sq] ? (Math.sqrt(sq) + 1)**2 : -1
  # is_square.call(sq) ? (Math.sqrt(sq) + 1)**2 : -1
end

p find_next_square(121), find_next_square(625), find_next_square(114)