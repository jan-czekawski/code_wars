# Create a function that will take any amount of money and break 
# it down to the smallest number of bills as possible. Only integer 
# amounts will be input, NO floats. This function should output an 
# array, where each element in the array represents the amount of a
# certain bill type. The array will be set up in this manner:

# array[0] ---> represents $1 bills

# array[1] ---> represents $5 bills

# array[2] ---> represents $10 bills

# array[3] ---> represents $20 bills

# array[4] ---> represents $50 bills

# array[5] ---> represents $100 bills

# In the case below, we broke up $365 into 1 $5 bill, 1 $10 bill, 1 $50 bill, and 3 $100 bills.

#   giveChange(365) // =>  [0,1,1,0,1,3]
# In this next case, we broke $217 into 2 $1 bills, 1 $5 bill, 1 $10 bill, and 2 $100 bills.

#   giveChange(217) // => [2,1,1,0,0,2]


# MY SOLUTION
def give_change(amount)
  bills = [100, 50, 20, 10, 5, 1]
  arr = []
  bills.each do |num|
    arr.unshift(amount / num)
    amount %= num
  end
  arr
end


# CLEVER SOLUTION
def give_change(ary)
  bills = [0, 0, 0, 0, 0]
  value = {:benjamin => 100, :grant => 50, :jackson => 20, :hamilton => 10, :lincoln => 5, :washington => 1}
  bills[5], left = ary.divmod(value[:benjamin])[0], ary.divmod(value[:benjamin])[1]
  bills[4], left = left.divmod(value[:grant])[0], left.divmod(value[:grant])[1]
  bills[3], left = left.divmod(value[:jackson])[0], left.divmod(value[:jackson])[1]
  bills[2], left = left.divmod(value[:hamilton])[0], left.divmod(value[:hamilton])[1]
  bills[1], left = left.divmod(value[:lincoln])[0], left.divmod(value[:lincoln])[1]
  bills[0] = left.divmod(value[:washington])[0] 
  bills
end

p give_change(365) #, [0,1,1,0,1,3])
p give_change(217) #, [2,1,1,0,0,2])