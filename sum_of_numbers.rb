# We want to generate a function that computes the series starting 
# from 0 and ending until the given number following the sequence:

# 0 1 3 6 10 15 21 28 36 45 55 ....

# which is created by

# 0, 0+1, 0+1+2, 0+1+2+3, 0+1+2+3+4, 0+1+2+3+4+5, 0+1+2+3+4+5+6, 0+1+2+3+4+5+6+7 etc..

# Input:

# LastNumber

# Output:

# series and result

# Example:

# Input:

# > 6
# Output:

# 0+1+2+3+4+5+6 = 21
# Input:

# > -15
# Output:

# -15<0
# Input:

# > 0
# Output:

# 0=0

# MY SOLUTION
class SequenceSum
  def self.show_sequence(n)
    if n > 0
      [*0..n].join("+") + " = " + (0..n).inject(:+).to_s
    elsif n < 0
      "#{n}<0"
    else
      "0=0"
    end
    # ONE LINER
    # n > 0 ? [*0..n]*"+" + " = #{(0..n).inject(:+)}" : "#{n < 0 ? "#{n}<" : "#{n}="}0"
  end
end

p SequenceSum.show_sequence(0)# "0=0", "This is just an example of how you can write your own TDD tests")
p SequenceSum.show_sequence(-1)# "-1<0", "This is just an example of how you can write your own TDD tests")
p SequenceSum.show_sequence(6)# "0+1+2+3+4+5+6 = 21", "This is just an example of how you can write your own TDD tests")
