# The Kata is inspired by Calculating with Functions Kata for JavaScript.

# The goal is to implement simple calculator which uses fluent syntax:

# Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3
# There are only four operations that are supported 
# (plus, minus, times, divided_by) and 10 digits (zero, one, two, 
# three, four, five, six, seven, eight, nine).

# Each calculation consists of one operation only.


class Calc
  
  attr_accessor :value, :operation

  NUM = {
    one: 1, two: 2, three: 3, four: 4, five: 5,
    six: 6, seven: 7, eight: 8, nine: 9
  }
  
  OPERATIONS = { plus: :+, minus: :-, times: :*, divided_by: :/ }
  
  def initialize
    @value = 0
    @operation
  end

  def method_missing(method_name)
    if @operation.nil?
      # if OPERATIONS.keys.any? { |oper| oper == method_name }
      if OPERATIONS.keys.include?(method_name)
        @operation = OPERATIONS[method_name]
      else
        @value = NUM[method_name]
      end
    else
      @value = @value.send(@operation,NUM[method_name])
      return @value
    end
    return self
  end  
  
end

# BEST SOLUTIONS
class Calc
  { zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }.each do |m, n|
    define_method("#{m}") { @proc ? @proc.call(n) : (@number ||= n ; self ) }
  end
  
  { plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |m, o|
    define_method("#{m}") { @proc ||= lambda { |a| @number.send(o, a) }; self } 
  end
end


class Calc
  def initialize
    @val = 0
    @op = nil
  end
  
  ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].each_with_index do |d, i|
      define_method(d) do
        return @val.send(@op, i) if @op
        @val = i
        self
      end
    end
    
    {'plus' => :+, 'minus' => :-, 'times' => :*, 'divided_by' => :/}.each do |o, sym|
      define_method(o) do
        @op = sym
        self
      end
    end
end

class Calc
  ACCEPTED_METHODS = { 
    one:'1', two:'2',   three:'3',  four:'4', five:'5',
    six:'6', seven:'7', eight:'8',  nine:'9', ten:'10',
    plus:'+', minus:'-', times:'*', divided_by:'/'
  }
  
  def method_missing(name)
    @calc_string = "#{@calc_string} #{ACCEPTED_METHODS[name]}".strip
    @calc_string.split.size == 3 ? eval(@calc_string) : self
  end
end




# CLEVER SOLUTION

# Chainable:
# Calc.new.one.plus.one.plus.one == 3

class Fixnum
  def plus;       Calc.new("+", self) end
  def minus;      Calc.new("-", self) end
  def times;      Calc.new("*", self) end
  def divided_by; Calc.new("/", self) end
end

class Calc
  def initialize(*arguments)
    if arguments.length == 2
      @operation = arguments[0]
      @number    = arguments[1]
    end
  end
  
  %w(zero one two three four five six seven eight nine).each_with_index do |w,i|
    define_method(w) { perform i }
  end
  
  def perform number
    if @operation
      @number.send(@operation, number)
    else
      number
    end
  end
end

class Calc
	NUMBERS    = { :zero => 0, :one => 1, :two => 2, :three => 3, :four => 4,
				   :five => 5, :six => 6, :seven => 7, :eight => 8, :nine => 9 }
	OPERATIONS = { :plus => :+, :minus => :-, :times => :*, :divided_by => :/ }

	def initialize
		NUMBERS.each do |key, value|
			define_singleton_method(key) do
				if @s.nil?
					@s = "#{value}"
					self
				else
					@s += "#{value}"
					eval(@s)
				end
			end
		end

		OPERATIONS.each do |key, value|
			define_singleton_method(key) do
				@s += "#{value}"
				self
			end
		end
		
	end
end

p Calc.new.four.plus.five #, 9)
p Calc.new.five.times.four #, 9)
