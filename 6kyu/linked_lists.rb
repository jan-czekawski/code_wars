# Linked Lists - Length & Count

# Implement Length() to count the number of nodes in a linked list.

# length(null) === 0
# length(1 -> 2 -> 3 -> null) === 3
# Implement Count() to count the occurrences of an integer in a linked list.

# count(null, 1) === 0
# count(1 -> 2 -> 3 -> null, 1) === 1
# count(1 -> 1 -> 1 -> 2 -> 2 -> 2 -> 2 -> 3 -> 3 -> null, 2) === 4
# I've decided to bundle these two functions within the same Kata since they are both very similar.

# The push() and buildOneTwoThree() functions do not need to be redefined.

# Inspired by Stanford Professor Nick Parlante's excellent Linked List teachings.

class Node
	attr_accessor :data, :next
  def initialize(data)
  	@data = data
    @next = nil
  end
end

def length(node)
  p node
end

def count(node, data)
	# Good Luck!
end

list = build_one_two_three()
p length(nil)#, 0, "Length of nil list should be zero.")
p length(Node.new(99))#, 1, "Length of single node list should be one.")
p length(list)#, 3, "Length of the three node list should be three.")


# list = build_one_two_three();
# p count(list, 1)#, 1, "list should only contain one 1.")
# p count(list, 2)#, 1, "list should only contain one 2.")
# p count(list, 3)#, 1, "list should only contain one 3.")
# p count(list, 99)#, 0, "list should return zero for integer not found in list.")
# p count(nil, 1)#, 0, "nil list should always return count of zero.")