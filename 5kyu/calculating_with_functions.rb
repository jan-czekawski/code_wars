# This time we want to write calculations using functions and get the results.
# Let's have a look at some examples:

# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3
# Requirements:

# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations:
# plus, minus, times, dividedBy (divided_by in Ruby)
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function
# represents the right operand

# MY SOLUTION
numbers = { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6,
            seven: 7, eight: 8, nine: 9 }

operations = { plus: :+, minus: :-, times: :*, divided_by: :/ }
  
numbers.each do |word, number|
  define_method("#{word}") do |*arg|
    if arg.size == 1
      arg[0].call(number)
    else
      number
    end
  end
end

operations.each do |word, operation|
  define_method("#{word}") do |num_1|
    num_1 = num_1.to_f if operation == :/
    ->(num_2) { num_2.send(operation, num_1) }
  end
end
  
# BEST SOLUTIONS
class Object
  %w[zero one two three four five six seven eight nine].each_with_index do |name, n|
    define_method(name) do |args = nil|
      args ? n.send(*args) : n.to_f
    end
  end
  
  %w[plus + minus - times * divided_by /].each_slice(2) do |name, symbol|
    define_method(name) do |n|
      [symbol, n]
    end
  end
end

class Object
  %i[ zero one two three four five six seven eight nine ].each_with_index do |name, number|
    define_method(name) do |operation = [ :to_f ]|
      number.send(*operation)
    end
  end
  
  %i[ plus + minus - times * divided_by / ].each_slice(2) do |name, operator|
    define_method(name) do |rhs|
      [ operator, *rhs ]
    end
  end
end

class Object
  %i(zero one two three four five six seven eight nine).each_with_index do |mth, i|
    define_method(mth) { |stack=nil| stack ? i.send(*stack) : i }
  end
  
  def plus(v); [:+, v]; end
  def minus(v); [:-, v]; end
  def times(v); [:*, v]; end
  def divided_by(v); [:fdiv, v]; end
end

module Calculations

  CALCULATE = lambda do |rop, operator, lop|
    operator[lop, rop.to_f]
  end

  %w(zero one two three four five six seven eight nine).each_with_index do |name, value|
    self.send :define_method, name do |calculate = nil|
      calculate ? calculate[value] : CALCULATE.curry[value]
    end
  end

  [[:plus, :+], [:minus, :-], [:times, :*], [:divided_by, :/]].each do |(name, op)|
    self.send :define_method, name do |calculate|
      calculate.curry[lambda &op]
    end
  end
end

include Calculations

def noop
  ->(n) { n }
end

module MathAndStuff
  %w(zero one two three four five six seven eight nine).each_with_index do |num, i|
    define_method num do |op=noop|
      op.call(i)  
    end
  end
  
  Hash[*%w(plus + minus - times * divided_by /)].each do |m, op|
     define_method m do |*args|
      ->(right, left) { left.to_f.send(op, right) }.curry.call(*args)
    end
  end
end
include MathAndStuff

p seven(times(five()))# 35
p four(plus(nine()))# 13
p eight(minus(three()))# 5
p two(divided_by(six()))# 3