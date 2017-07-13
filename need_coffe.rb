# Everybody know that you passed to much time awake during night time...

# Your task here is to define how much coffee you need to stay 
# awake after your night. You will have to complete a function 
# that take an array of events in arguments, according to this 
# list you will return the number of coffee you need to stay awake 
# during day time. Note: If the count exceed 3 please return 'You need extra sleep'.

# The list of events can contain the following:

# You come here, to solve some kata ('cw').
# You have a dog or a cat that just decide to wake up too early ('dog' | 'cat').
# You just watch a movie ('movie').
# Other events can be present and it will be represent by arbitrary 
# string, just ignore this one.
# Each event can be downcase/lowercase, or uppercase. If it is
# downcase/lowercase you need 1 coffee by events and if it is 
# uppercase you need 2 coffees.


# MY SOLUTION
def how_much_coffee(events, sum = 0)
  events.each { |ev| ev.sub(/\A(cw|cat|dog|movie)\z/i) { |pt| sum += pt == pt.upcase ? 2 : 1} } 
  # events.each do |ev|
  #   ev.sub(/\A(cw|cat|dog|movie)\z/i) do |pt|
  #     sum += pt == pt.upcase ? 2 : 1
  #   end
  # end
  sum > 3 ? "You need extra sleep" : sum
  # sum = events.select { |ev| ev =~ /\A(cw|cat|dog|movie)\z/i }.inject(0) do |cof, act|
  #   cof += act == act.upcase ? 2 : 1
  # end
  # sum > 3 ? "You need extra sleep" : sum
end

# BEST SOLUTIONS
def how_much_coffee(events)
  e = events.grep(/^(cat|dog|movie|cw)$/i)
  c = e.count + e.grep(/[A-Z]/).count
  c > 3 ? 'You need extra sleep' : c
end

def how_much_coffee(events)
  coffee = 0
  events.each do |event|
    next unless event =~ /^(cw|dog|cat|movie)$/i 
    coffee += 1 if event == event.downcase
    coffee += 2 if event == event.upcase
    return "You need extra sleep" if coffee > 3
  end
  coffee
end

def how_much_coffee(events)
  
  events_match = ["CAT", "cat", "DOG", "dog", "movie", "MOVIE", "cw", "CW"] 
  coffee_events = events&events_match
  
  score = []
  score_dbl = []
    
  coffee_events.each do |x|
    if x == x.upcase
      score_dbl << x
    elsif x == x.downcase
      score << x
    end
  end
  
  score_total = score.count + score_dbl.count*2
  
  if score_total > 3
    "You need extra sleep" 
  else
  p score_total
  end
end


THINGS = %w(cw cat dog movie)
THING_TO_COFFEE = THINGS.each_with_object(Hash.new(0)) { |thing, hash| hash[thing] = 1; hash[thing.upcase] = 2 }
  
def how_much_coffee(events)
  coffee = events.inject(0) do |sum, event|
    sum += THING_TO_COFFEE[event]
  end
  
  coffee > 3 ? "You need extra sleep" : coffee
end


def how_much_coffee(events)
  coffee_events = events.select{|x| x =~ /\A(cw|dog|cat|movie)\z/i}
  score = coffee_events.map do |x|
    if x.upcase === x
      2
    else
      1
    end
  end.reduce(0,:+)
  score > 3 ? "You need extra sleep" : score
end

  p how_much_coffee([]) #, 0) #
  p how_much_coffee(["cw"]) #, 1) #
  p how_much_coffee(["CW"]) #, 2) #
  p how_much_coffee(['cw','CAT']) #, 3) #
  p how_much_coffee(['cw','CAT','DOG']) #, 'You need extra sleep') #
  p how_much_coffee(['cw','CAT', 'cw=others']) #, 3) #
