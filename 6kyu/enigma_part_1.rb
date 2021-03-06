# In this series of Kata, we will be implementing a software
# version of the Enigma Machine.

# The Enigma Machine was a message enciphering/deciphering
# machine used during the Second World War for disguising the 
# content of military communications. Alan Turing - the father
# of computing - formulated and developed concepts that are the 
# basis of all computers in use today, he did this in response
# to the vital need to break those military communications. Turing
# and his colleagues at Bletchley Park are generally recognised
# as being responsible for shortening WWII by two years and saving
# an estimated 22 Million lives.

# The Enigma Machine consisted of a number of parts: Keyboard for
# input, rotors and plugboard for enciphering, and lampboard for output.

# We will simulate input and output with strings, and build the
# rotors, plugboard and mechanism that used them in software.
# As we progress the code will become more complex, so you are 
# advised to attempt them in order.

# Step 1: The plugboard

# In this Kata, you must implement the plugboard.

# Physical Description

# The plugboard crosswired the 26 letters of the latin alphabet 
# togther, so that an input into one letter could generate output
# as another letter. If a wire was not present, then the input 
# letter was unchanged. Each plugboard came with a maximum of 10 
# wires, so at least six letters were not cross-wired.

# For example:

# If a wire connects A to B, then an A input will generate a B output 
# and a B input will generate an A output.
# If no wire connects to C, then only a C input will generate a C output.
# Note

# In the actual usage of the original Enigma Machine, punctuation was
# encoded as words transmitted in the stream, in our code, anything 
# that is not in the range A-Z will be returned unchanged.

# Kata

# The Plugboard class you will implement, will:

# Take a list of wire pairs at construction in the form of a string, 
# with a default behaviour of no wires configured. E.g. "ABCD" would 
# wire A <-> B and C <-> D.
# Validate that the wire pairings are legitimate. Raise an exception if not.
# Implement the process method to translate a single character input
# into an output.
# Haskell remarks

# Since Haskell doesn't have classes, plugboard is a function that 
# either returns a Char -> Char function for processing, or an error message.

# Examples

# plugboard = Plugboard("ABCDEFGHIJKLMNOPQRST")
# print plugboard.process("A")
# print plugboard.process("B")
# print plugboard.process("X")
# print plugboard.process(".")
# Expected output:

# B
# A
# X
# .

# MY SOLUTION
class Plugboard
  def initialize(wires = "")
    raise if wires.size > 20 || wires.size.odd? || wires.split("").uniq != wires.split("")
    @wires = wires.scan(/[a-z]{2}/i)
  end
  
  def process(wire = "")
    str = @wires.select { |pair| pair.include?(wire) }[0]
    str.nil? ? wire : str.delete(wire)
  end
end


# BEST SOLUTIONS
class Plugboard
  attr_reader :mapping
  
  def initialize(wires = "")
    fail "Not enough wire ends defined" if wires.length.odd?
    fail "Too many wires defined" if wires.length > 20
    fail "Letters can only be mapped once" unless wires.chars.uniq == wires.chars
    @mapping = Hash[wires.scan(/(.)(.)/).flat_map { |a, b| [[a, b], [b, a]] }]
  end
  
  def process(wire)
    mapping.fetch(wire, wire)
  end
end


class Plugboard
  def initialize wires = ''
    @wires = wires
    raise if @wires.size > 20 || @wires != @wires.chars.uniq.join || @wires.size % 2 != 0
  end
  def process(wire)
    i = @wires.chars.index(wire)
    i.nil? ? wire : @wires[i + 1 - 2*(i%2)]
  end
end

class Plugboard
  def initialize(wires="")
    @wires = wires
    raise if @wires.size.odd? || (@wires.size) > 20 || @wires != @wires.chars.uniq.join
  end
  def process(wire)
    i = @wires.chars.index(wire)
    if i.nil?
      wire
    elsif i.even?
      @wires[i+1]
    else i.odd?
      @wires[i-1]
    end
  end
end


class Plugboard
  def initialize(wires='')
    if wires.empty?
      @wires = {}
      return
    end
    
    characters = wires.chars.to_a

    if wires !~ /\A[A-Z]+\z/ 
      raise "Invalid wires specified in input: #{wires}"
    elsif wires.length % 2 == 1 
      raise "Odd number of wires specified: #{wires}"
    elsif characters.uniq.length != characters.length
      raise "Wires are defined multiple times: #{wires}"
    elsif wires.length > 20
      raise "Too many wire pairs are defined, limit 10 pairs: #{wires}"
    end
    
    dictionary = Hash[characters.each_slice(2).to_a]
    @wires = dictionary.merge(dictionary.invert)
  end
  
  def process(wire)
    @wires.fetch(wire, wire)
  end
end

plugboard = Plugboard.new("AB")
# plugboard = Plugboard.new("ABCDEF")
p plugboard.process('A')#, 'B', "Invalid translation")
p plugboard.process('B')#, 'A', "Invalid translation")
p plugboard.process('C')#, 'C', "Invalid translation")