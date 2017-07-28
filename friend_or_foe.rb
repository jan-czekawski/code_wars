# Make a program that filters a list of strings and 
# returns a list with only your friends name in it.

# If a name has exactly 4 letters in it, you can 
# be sure that it has to be a friend of yours!

# Ex: Input = ["Ryan", "Kieran", "Jason", "Yous"], Output = ["Ryan", "Yous"]

# MY SOLUTION
def friend(friends)
  friends.select { |name| name.length == 4 }
end

# BEST SOLUTIONS
def friend(friends)
  friends.grep(/^\w{4}$/)
end

p friend(["Ryan", "Kieran", "Mark"])# ["Ryan", "Mark"])
p friend(["Ryan", "Jimmy", "123", "4", "Cool Man"])# ["Ryan"])
p friend(["Jimm", "Cari", "aret", "truehdnviegkwgvke", "sixtyiscooooool"])# ["Jimm", "Cari", "aret"])
p friend(["Love", "Your", "Face", "1"])# ["Love", "Your", "Face"])
p friend(["----"])