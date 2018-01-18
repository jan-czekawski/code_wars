# John and Mary want to travel between a few towns A, B, C ... Mary 
# has on a sheet of paper a list of distances between these towns.
# ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to
# Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

# Which distances, hence which towns, they will choose so that the sum
# of the distances is the biggest possible

# to please Mary - but less than t - to please John- ?
# Example:

# With list ls and 3 towns to visit they can make a choice between:
# [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

# The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

# The biggest possible sum taking a limit of 174 into account 
# is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

# The function chooseBestSum (or choose_best_sum or ... depending
# on the language) will take as parameters t (maximum sum of distances,
# integer >= 0), k (number of towns to visit, k >= 1) and ls 
# (list of distances, all distances are positive or null integers and this list
# has at least one element). The function returns the "best" sum ie the biggest possible
# sum of k distances less than or equal to the given limit t, 
# if that sum exists, or otherwise nil, null, None, Nothing, 
# depending on the language. With C++, C, Rust, Swift, Go return -1.

# Examples:

# ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

# xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, Rust, Swift, Go)

# ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228


# ls => list, k => town Kount, t => limiT
def choose_best_sum(t, k, ls)
  combos = []
  all_possib = ls.sort.combination(k).to_a
  # ls.sort.combination(k).to_a.map { |item| item.inject(:+) }.select { |sum| sum <= t}.max
  all_possib.size.times { |x| combos[x] = all_possib[x].inject(:+) }
  combos.empty? ? nil : combos.select{ |combo| combo <= t}.max
end

def choose_best_sum(t, k, ls)
  ls.combination(k).map { |ds| ds.inject(:+) }.reject{ |d| d > t }.max
end


ts = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, ts) # 163)
ts = [50]
p choose_best_sum(163, 3, ts) #, nil)
ts = [91, 74, 73, 85, 73, 81, 87]
p choose_best_sum(230, 3, ts) #, 228)