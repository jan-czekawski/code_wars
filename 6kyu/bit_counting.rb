# Write a function that takes an (unsigned) integer as input, and returns the
# number of bits that are equal to one in the binary representation of that
# number.

# Example: The binary representation of 1234 is 10011010010, so the function
# should return 5 in this case

# MY SOLUTION
def count_bits(n)
  result = ""
  
  while n > 0 do
    result += n % 2 == 0 ? "0" : "1"
    n /= 2
  end
  result << "0" if result == ""
  
  result.reverse.count("1")
end

def count_bits(n)
  n.to_s(2).count("1")
end

def count_bits(n)
  bits = 0
  while (n > 0)
    bits += n & 1
    n = n >> 1
  end
  bits
end

p count_bits(0), count_bits(4), count_bits(7), count_bits(9), count_bits(10)