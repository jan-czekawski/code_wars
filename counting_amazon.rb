# The Arara are an isolated tribe found in the Amazon 
# who count in pairs. For example one to eight is as follows:

# 1 = anane 
# 2 = adak 
# 3 = adak anane 
# 4 = adak adak 
# 5 = adak adak anane 
# 6 = adak adak adak
# 7 = adak adak adak anane
# 8 = adak adak adak adak 

# Take a given number and return the Arara's equivalent.

# e.g.

# count_arara(3) # -> 'adak anane'

# count_arara(8) # -> 'adak adak adak adak'

# MY SOLUTION
def count_arara (n)
  arr = []
  while n > 1
    n -= 2
    arr << "adak"
  end
  arr << "anane" if n == 1
  arr.join(" ")
end

# BEST SOLUTIONS
def count_arara(n)
  (['adak'] * (n / 2) + ['anane'] * (n % 2)).join(' ')
end

def count_arara (n)
  str = "adak " * (n/2)
  n.even? ? str.strip : str + "anane"
end

def count_arara (n)
  x, y = n.divmod(2)
  (("adak " * x) + ("anane" * y)).strip
end

p count_arara(1)#"anane");
p count_arara(2)#"adak");
p count_arara(3)#"adak anane");
p count_arara(9)#"adak adak adak adak anane");