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


def series_sum(n)
  return "0.00" if n == 0
  
  res = (1..n).inject { |sum, x| sum + (1.00 / ( (x-1) * 3 + 1 )) }
              .round(2)
              .to_s
  res += "0" if res.length < 4
  res
end

p series_sum(1)# "1.00")
p series_sum(2)# "1.25")
p series_sum(3)# "1.39")