# Your task is to make function, which returns the sum of a sequence of integers.

# The sequence is defined by 3 non-negative values: begin, end, step.

# If begin value is greater than the end, function should returns 0

# Examples

# sequenceSum(2,2,2) === 2
# sequenceSum(2,6,2) === 12 // 2 + 4 + 6
# sequenceSum(1,5,1) === 15 // 1 + 2 + 3 + 4 + 5
# sequenceSum(1,5,3) === 5 // 1 + 4
# This is the first kata in the series:

# 1) Sum of a sequence (this kata)
# 2) Sum of a Sequence [Hard-Core Version]

def sequence_sum(begin_number, end_number, step)
  return 0 if end_number < begin_number
  
  x = begin_number
  sum = 0
  
  while x <= end_number
    sum += x
    x += step
  end
  
  sum
end


p sequence_sum(2, 6, 2)# 12)
p sequence_sum(1, 5, 1)# 15)
p sequence_sum(1, 5, 3)# 5)
p sequence_sum(0, 15, 3)# 45)
p sequence_sum(16, 15, 3)# 0)
p sequence_sum(2, 24, 22)# 26)
p sequence_sum(2, 2, 2)# 2)
p sequence_sum(2, 2, 1)# 2)
p sequence_sum(1, 15, 3)# 35)
p sequence_sum(15, 1, 3)# 0)
