# Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double Cola"
# drink vending machine; there are no other people in the queue. The first one
# in the queue (Sheldon) buys a can, drinks it and doubles! The resulting two
# Sheldons go to the end of the queue. Then the next in the queue (Leonard) 
# buys a can, drinks it and gets to the end of the queue as two Leonards, and so on.

# For example, Penny drinks the third can of cola and the queue will look like this:

# Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny
# Write a program that will return the name of a man who will drink the n-th cola.

# Note that in the very beginning the queue looks like that:

# Sheldon, Leonard, Penny, Rajesh, Howard
# ##Input

# The input data consist of an array which contains five names, and single integer n.

# (1 ≤ n ≤ 1_000_000_000).
# ##Output / Examples Return the single line — the name of the person who drinks
# the n-th can of cola. The cans are numbered starting from 1. Please note 
# that you should spell the names like this: "Sheldon", "Leonard", "Penny", 
# "Rajesh", "Howard" (without the quotes). In that order precisely the friends 
# are in the queue initially.

# whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1)=="Sheldon"
# whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52)=="Penny"
# whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951)=="Leonard"
# before 1
# 1 = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]
# 2 = ["Leonard", "Penny", "Rajesh", "Howard", "Sheldon", "Sheldon"]
# 3 = ["Penny", "Rajesh", "Howard", "Sheldon", "Sheldon", "Leonard", "Leonard"]
# 4 = ["Rajesh", "Howard", "Sheldon", "Sheldon", "Leonard", "Leonard", "Penny", "Penny"]
# 5 = ["Howard", "Sheldon", "Sheldon", "Leonard", "Leonard", "Penny", "Penny", "Rajesh", "Rajesh"]
# 6 = ["Sheldon", "Sheldon", "Leonard", "Leonard", "Penny", "Penny", "Rajesh", "Rajesh", "Howard", "Howard"]
# 7 = ["Sheldon", "Leonard", "Leonard", "Penny", "Penny", "Rajesh", "Rajesh", "Howard", "Howard", "Sheldon", "Sheldon"]
# 8 = ["Leonard", "Leonard", "Penny", "Penny", "Rajesh", "Rajesh", "Howard", "Howard", "Sheldon", "Sheldon", "Sheldon", "Sheldon"]


names = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

def whoIsNext(names, r)
  i = 1
  until i == r
    name = names.shift
    names << name << name
    i += 1
  end
  names
end



# p whoIsNext(names, 1) # Sheldon * 1
# p whoIsNext(names, 6) # 5 * 2**0      Sheldon * 2
# p whoIsNext(names, 11) # 5 * 2**1     Sheldon * 4
# p whoIsNext(names, 21) # 5 * 2**2     Sheldon * 8
# p whoIsNext(names, 41) # 5 * 2**3     Sheldon * 16
# p whoIsNext(names, 81) # 5 * 2**4     Sheldon * 32
# 81 = 1 + 5 * 2**4     Sheldon * 2**(4+1)
# 81 = 1 + 5 * 2**x
# 81 - 1 = 5 * 2**x
# (81 - 1)/5 = 2**x
# log(2)((81 - 1)/5) = x
r = 7_230_702_951
p x = Math.log2((r - 1)/5)
p y = 1 + 2**31 + 2**30 + 2**30 + 2**30 + 2**30

# p whoIsNext(names, 6) # Sheldon
# p whoIsNext(names, 52) # =="Penny"
# p whoIsNext(names, 7_230_702_951) #=="Leonard"
