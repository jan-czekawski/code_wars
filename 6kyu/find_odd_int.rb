# Given an array, find the int that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.

# MY SOLUTION
def find_it(seq)
  # hash = Hash.new
  
  # seq.each do |num|
  #   if hash[num].nil?
  #     hash[num] = 1
  #   else
  #     hash[num] += 1
  #   end
  # end
  
  hash = Hash.new(0)
  seq.each { |num| hash[num] += 1 }
  
  hash.each { |k, v| return k if v.odd? }
end

# BEST SOLUTIONS
def find_it(seq)
  Hash.new(0).tap { |h| seq.each { |i| h[i] += 1 } }.find { |k, v| v.odd? }[0]
end

def find_it(seq)
  # seq.find(-> {"nope"} ) { |n| seq.count(n).odd? }
  # seq.find(Proc.new {"nope"} ) { |n| seq.count(n).odd? }
  # seq.find { |n| seq.count(n).odd? }
  seq.detect { |n| seq.count(n).odd? }
end

def find_it(seq)
  #Hash is cheaper than calling arr.count(num) for every number.... I think?
  h = seq.each_with_object(Hash.new(0)){|x,m| m[x] += 1}
  return h.invert[h.values.find{|x| x % 2 == 1}]
end

def find_it(seq)
  seq.reduce(:^)
  # seq.reduce { |sum, num| sum ^ num}
end

def find_it(seq)
  seq.uniq.each do |val|
    return val if seq.count(val).odd?
  end
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) # 5)
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) # -1)
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) # 5)
p find_it([10]) # 10)
p find_it([1,1,1,1,1,1,10,1,1,1,1]) # 10)



require "benchmark"
n = 100_000
Benchmark.bm do |x|
  x.report { n.times { find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])} }
end