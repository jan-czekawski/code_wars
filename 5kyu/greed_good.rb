# Greed is a dice game played with five six-sided dice. Your mission, 
# should you choose to accept it, is to score a throw according to these 
# rules. You will always be given an array with five six-sided dice values.

# Three 1's => 1000 points
# Three 6's =>  600 points
# Three 5's =>  500 points
# Three 4's =>  400 points
# Three 3's =>  300 points
# Three 2's =>  200 points
# One   1   =>  100 points
# One   5   =>   50 point
# A single die can only be counted once in each roll. For example, 
# a "5" can only count as part of a triplet (contributing to the 500 points)
# or as a single 50 points, but not both in the same roll.

# Example scoring

# Throw       Score
# ---------   ------------------
# 5 1 3 4 1   50 + 2 * 100 = 250
# 1 1 1 3 1   1000 + 100 = 1100
# 2 4 4 5 4   400 + 50 = 450



def score( dice )
  res = 0
  val = { "111" => 1000, "666" => 600, "555" => 500, "444" => 400,
          "333" => 300, "222" => 200, "1" => 100, "5" => 50 }

  [*1..6].each do |num|
    next if dice.count(num).nil?
    many = dice.count(num)
    if many >= 3
      res += val[num.to_s * 3]
      many -= 3
    end
    if num == 1 || num == 5
      until many < 1
        res += val[num.to_s]
        many -= 1
      end
    end
  end
  
  res
end


# BEST SOLUTIONS
def score( dice )
  score = 0
  (1..6).each do |i|
    counter = dice.select { |n| n == i }
    score = (i == 1 ? 1000 : i * 100) if counter.size >= 3
    # score =+ (i == 1 ? 1000 : i * 100) if counter.size >= 3
    score += (counter.size % 3) * 100 if i == 1
    score += (counter.size % 3) * 50 if i == 5
  end
  score
end

def score(dice)
  dice.sort.join.gsub(/(\d)\1\1|(1|5)/).inject(0) do |sum, num|
    sum + ($1.to_i * 100 + $2.to_i * 10 ) * (num[0] == '1' ? 10 : 1)
  end
end

def score( dice )
  m = {1 => 100, 5 => 50}
  (1..6).reduce(0) do|res, i|
    count = dice.count(i)    
    res + count/3 * i * (i==1 ? 1000 : 100) + count%3*(m[i].to_i)
  end
end

SCORE_MAP = {
  1 => [0, 100, 200, 1000, 1100, 1200, 2000],
  2 => [0, 0, 0, 200, 200, 200, 400],
  3 => [0, 0, 0, 300, 300, 300, 600],
  4 => [0, 0, 0, 400, 400, 400, 800],
  5 => [0, 50, 100, 500, 550, 600, 1000],
  6 => [0, 0, 0, 600, 600, 600, 1200]
}

def score( dice )
  (1..6).inject(0) do |score, die|
    score += SCORE_MAP[die][dice.count(die)]
  end
end

  # it "should value this as worthless" do
    p score( [2, 3, 4, 6, 2] ) #== 0,   "Should be 0 :-(" );
  
  # it "should value this triplet correctly" do
    p score( [2, 2, 2, 3, 3] ) #== 200, "Should be 200" );
  
  # it "should value this mixed set correctly" do
    p score( [2, 4, 4, 5, 4] ) #== 450, "Should be 450" );