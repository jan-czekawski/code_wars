# ###Task:

# Your task is to write a function which returns the sum of following series upto nth term(parameter).

# Series: 1 + 1/4 + 1/7 + 1/10 + 1/13 + 1/16 +...
# ###Rules:

# You need to round the answer upto 2 decimal places and return it as String.
# If the given value is 0 then it should return 0.00
# You will only be given Natural Numbers as arguments.
# ###Examples:

# SeriesSum(1) => 1 = "1"
# SeriesSum(2) => 1 + 1/4 = "1.25"
# SeriesSum(5) => 1 + 1/4 + 1/7 + 1/10 + 1/13 = "1.57"
# NOTE: In PHP the function is called series_sum().

# MY SOLUTION
def series_sum(n)
  return "0.00" if n == 0
  
  res = (1..n).inject { |sum, x| sum + (1.00 / ( (x-1) * 3 + 1 )) }
              # .round(2)
              # .to_s
  # res += "0" if res.length < 4
  # res
  format("%.2f", res)
  # "%.2f" % res
end

# BEST SOLUTIONS
def series_sum(n)
  return "0.00" if n == 0
  '%.2f' % (0..n-1).map { | x | (1.0/(x*3+1))}.reduce(:+)
end

def series_sum(n)
  i = 1
  sum = 0  
  n.times do
    sum += Rational(1) / i.to_f
    i += 3
  end
  "%.2f" % sum
end


def series_sum(n)
  return "0.00" if n < 1
  "%.2f" % series.take(n).reduce(:+)
end

def series
  denom = 1.0
  
  Enumerator.new do |y|
    loop do
      y.yield 1 / denom
      denom += 3.0
    end
  end
end


def series_sum(n)
  denominator = 1
  total = 0
  n.times do 
    total += (1.0/denominator)
    denominator += 3
  end
  "#{format("%.2f", total)}"
end

p series_sum(0)# "1.00")
p series_sum(1)# "1.00")
p series_sum(2)# "1.25")
p series_sum(3)# "1.39")