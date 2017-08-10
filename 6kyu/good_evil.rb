# Description

# Middle Earth is about to go to war. The forces of good will have many
# battles with the forces of evil. Different races will certainly be 
# involved. Each race has a certain 'worth' when battling against others. 
# On the side of good we have the following races, with their associated worth:

# Hobbits - 1
# Men - 2
# Elves - 3
# Dwarves - 3
# Eagles - 4
# Wizards - 10
# On the side of evil we have:

# Orcs - 1
# Men - 2
# Wargs - 2
# Goblins - 2
# Uruk Hai - 3
# Trolls - 5
# Wizards - 10
# Although weather, location, supplies and valor play a part in any 
# battle, if you add up the worth of the side of good and compare it
# with the worth of the side of evil, the side with the larger worth
# will tend to win.

# Thus, given the count of each of the races on the side of good, 
# followed by the count of each of the races on the side of evil, 
# determine which side wins.

# Input:

# The function will be given two parameters. Each parameter will be 
# a string separated by a single space. Each string will contain the
# count of each race on the side of good and evil.

# The first parameter will contain the count of each race on the side
# of good in the following order:

# Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
# The second parameter will contain the count of each race on the side 
# of evil in the following order:

# Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
# All values are non-negative integers. The resulting sum of the worth
# for each side will not exceed the limit of a 32-bit integer.

# Output:

# Return ""Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil
# eradicates all trace of Good" if evil wins, or 
# "Battle Result: No victor on this battle field" if it ends in a tie.

# MY SOLUTION
def goodVsEvil(good, evil)
  # good_power, evil_power = 0, 0
  # good.split.each_with_index do |num, i|
  #   if i < 3
  #     good_power += num.to_i * (i + 1)
  #   elsif i < 5
  #     good_power += num.to_i * i
  #   elsif i == 5
  #     good_power += num.to_i * 2 * i
  #   end
  # end
  god = good.split.each_with_index.inject(0) do |sum, (num, i)|
          if i < 3
            sum + num.to_i * (i + 1)
          elsif i < 5
            sum + num.to_i * i
          elsif i == 5
            sum + num.to_i * 2 * i
          end
        end
  
  
  evl = evil.split.each_with_index.inject(0) do |sum, (num, i)|
          case i
          when 0
            sum + num.to_i * (i + 1)
          when 1, 2, 3
            sum + num.to_i * 2
          when 4
            sum + num.to_i * (i - 1)
          when 5
            sum + num.to_i * i
          when 6
            sum + num.to_i * (i + 4) 
          end
        end
  
  if evl > god
    str = "Evil eradicates all trace of Good"
  elsif evl < god
    str = "Good triumphs over Evil"
  else
    str = "No victor on this battle field"
  end
  
  "Battle Result: #{str}"
end

# BEST SOLUTIONS
def total_worth(counts, worth_table)
  counts.split.each_with_index.reduce(0) { |sum, (c, i)| sum + ( worth_table[i] * c.to_i ) }
end 

def goodVsEvil(good, evil)
  case total_worth(good, [1,2,3,3,4,10]) <=> total_worth(evil, [1, 2, 2, 2, 3, 5, 10])
  when 1 then "Battle Result: Good triumphs over Evil"
  when -1 then "Battle Result: Evil eradicates all trace of Good"
  when 0 then "Battle Result: No victor on this battle field"
  end 
end

def goodVsEvil(good, evil)
  goodtot = good.split(' ').zip([1,2,3,3,4,10]).map { |a, b| a.to_i * b }.reduce(:+)
  eviltot = evil.split(' ').zip([1,2,2,2,3,5,10]).map { |a, b| a.to_i * b }.reduce(:+)
  if goodtot > eviltot
    "Battle Result: Good triumphs over Evil" 
  elsif eviltot > goodtot
    "Battle Result: Evil eradicates all trace of Good" 
  else
    "Battle Result: No victor on this battle field"
  end
end

GOOD_WORTH = [1, 2, 3, 3, 4, 10].freeze
EVIL_WORTH = [1, 2, 2, 2, 3, 5, 10].freeze

def goodVsEvil(good, evil)
  sum_worth = ->(sum, (n, worth)) { sum + n.to_i * worth }
  good_total = good.split.zip(GOOD_WORTH).inject(0, &sum_worth)
  evil_total = evil.split.zip(EVIL_WORTH).inject(0, &sum_worth)

  result = case good_total <=> evil_total
           when 1 then "Good triumphs over Evil"
           when -1 then "Evil eradicates all trace of Good"
           else "No victor on this battle field"
           end

  "Battle Result: #{result}"
end

require "matrix"
def goodVsEvil(good, evil)
  
  sum_good=Vector.elements(good.split(" ").map(&:to_i)).inner_product(Vector[1,2,3,3,4,10])
  sum_evil=Vector.elements(evil.split(" ").map(&:to_i)).inner_product(Vector[1,2,2,2,3,5,10])
  if sum_good > sum_evil then
    return "Battle Result: Good triumphs over Evil"
    elsif sum_good<sum_evil then
    return "Battle Result: Evil eradicates all trace of Good"
    else return "Battle Result: No victor on this battle field"
  end    
end

p goodVsEvil('1 0 0 0 0 0', '1 0 0 0 0 0 0')#= 'Battle Result: No victor on this battle field', 'Should be a tie' )
p goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')#= 'Battle Result: Good triumphs over Evil', 'Good should triumph' )
p goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0')#= 'Battle Result: Good triumphs over Evil', 'Good should triumph' )
