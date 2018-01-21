# Bob is preparing to pass IQ test. The most frequent task in this test
# is to find out which one of the given numbers differs from the others.
# Bob observed that one number usually differs from the others in evenness. Help Bob — to check his answers, he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.

# ! Keep in mind that your task is to help Bob solve a real IQ test,
# which means indexes of the elements start from 1 (not 0)

# ##Examples :
# iq_test("2 4 7 8 10") => 3 // Third number is odd, while the rest of the numbers are even

# iq_test("1 2 1 1") => 2 // Second number is even, while the rest of the numbers are odd

# MY SOLUTION
def iq_test1(numbers)
  numbers = numbers.split.map(&:to_i)
  # numbers[0..2].count(&:even?) > 1 ? numbers.index(&:odd?) + 1 : numbers.index(&:even?) + 1
  if numbers[0..2].count(&:even?) > 1
    numbers.index(&:odd?) + 1
  else
    numbers.index(&:even?) + 1
  end
end

# BEST SOLUTION
def iq_test2(numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end

def iq_test3(numbers)
  numbers = numbers.split.map(&:to_i)
  ei = nil
  oi = nil
  odd_count = 0
  even_count = 0
  numbers.each_with_index do |n, i|
    if n.even?
      return i + 1 if odd_count > 1
      even_count += 1
      return oi + 1 if (even_count > 1 and oi)
      ei = i
    else
      return i + 1 if even_count > 1
      odd_count += 1
      return ei + 1 if (odd_count > 1 and ei)
      oi = i
    end 
  end
end

def iq_test(numbers)
  ar = numbers.split.map(&:to_i)
  ar.index(ar.partition(&:even?).find(&:one?).first) + 1
end

def iq_test(numbers)
  numbers = numbers.split(" ").map{|n| n.to_i.even? }
  return numbers.index(numbers.count(false) == 1 ? false : true) + 1
end

def iq_test(numbers)
  sieve = numbers.split.map { |n| n.to_i.even? }
  sieve.index(sieve.count(true) < 2).succ
end

p iq_test("2 4 7 8 10")#3)
p iq_test("1 2 2")# 1)

# require "benchmark"
# n = 100_000
# Benchmark.bm do |x|
#   x.report { n.times { iq_test1("2 4 7 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42") }  }
#   x.report { n.times { iq_test2("2 4 7 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42") }  }
#   x.report { n.times { iq_test3("2 4 7 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42") }  }
# end