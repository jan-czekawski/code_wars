# If you like Taco Bell, you will be familiar with their signature
# doritos locos tacos. They're very good.

# Why can't everything be a taco? We're going to attempt that here,
# turning every word we find into the taco bell recipe with each ingredient.

# We want to input a word as a string, and return a list representing
# that word as a taco.

# Key

# all vowels (except 'y') = beef

# t = tomato

# l = lettuce

# c = cheese

# g = guacamole

# s = salsa

# NOTE
# We do not care about case here. 'S' is therefore equivalent
# to 's' in our taco.

# Ignore all other letters; we don't want our taco uneccesarily 
# clustered or else it will be too difficult to eat.

# Note that no matter what ingredients are passed, our taco will
# always have a shell.

# MY SOLUTION
TACO = { "aeiou" => "beef",  "t" => "tomato", "l" => "lettuce",
        "c" => "cheese", "g" => "guacamole", "s" => "salsa" }

def tacofy(word)
  word.downcase.chars.map { |le| le.gsub(/[aeiou]/, 'beef') }.map do |lt|
    if lt.size == 1
      TACO[lt]
    else
      lt
    end
  end.compact.unshift("shell").push("shell")
end

TACO = { "t" => "tomato", "l" => "lettuce", "c" => "cheese",
         "g" => "guacamole", "s" => "salsa" }

def tacofy(word)
  recipe = Array.new
  word.downcase.chars.map do |le| 
    recipe.push(le =~ /[aeiou]/ ? "beef" : TACO[le])
  end
  ["shell"] + recipe.compact + ["shell"]
end

TACO = { "a" => "beef", "e" => "beef", "i" => "beef", "o" => "beef",
        "u" => "beef", "t" => "tomato", "l" => "lettuce", "c" => "cheese",
        "g" => "guacamole", "s" => "salsa" }

def tacofy(word)
  word.downcase.chars.map { |lt| TACO[lt] }.compact.unshift("shell").push("shell")
end

# CLEVER SOLUTIONS
def tacofy(word)
  recipe = { 't'=>'tomato', 'l'=>'lettuce', 'c'=>'cheese', 'g'=>'guacamole', 's'=>'salsa' }
  word = word.downcase.gsub(/[^a-z]/, '')
  result = word.chars.map do |letter|
    if letter.match(/[aeiou]/)
      'beef'
    elsif recipe.keys.include?(letter)
      recipe[letter]
    end
  end
  result = result.compact
  ['shell'] + result + ['shell']
end

def tacofy(word)
  
  taco_recipe = ["shell"]; word_arr = word.split("")
  
  recipe_hash = {"t" => "tomato", "l" => "lettuce", "c" => "cheese", "g" => "guacamole", "s" => "salsa"}
  
  word_arr.each { |letter| letter.downcase =~ /[aeiou]/ ? taco_recipe << "beef" : taco_recipe << recipe_hash[letter.downcase] }
  
  taco_recipe << "shell"
    
  return taco_recipe.compact
  
end

def tacofy(word)
  TacoBuilder.new(word).call
end

class TacoBuilder

  def initialize(word)
    @word = word
    @taco = ["shell"]
  end
  
  def call
    @word.downcase.chars.each do |char|
      @taco << "beef" if char.match(/[aeiou]/)
      @taco << "tomato" if char.match(/t/)
      @taco << "lettuce" if char.match(/l/)
      @taco << "cheese" if char.match(/c/)
      @taco << "guacamole" if char.match(/g/)
      @taco << "salsa" if char.match(/s/)
    end
    @taco << "shell"
  end

end


p tacofy("") #,['shell', 'shell'])
p tacofy("a") #, ['shell', 'beef', 'shell'])
p tacofy("ggg") #, ['shell', 'guacamole', 'guacamole', 'guacamole', 'shell'])
p tacofy("ogl") #,['shell', 'beef', 'guacamole', 'lettuce', 'shell'])
p tacofy("ydjkpwqrzto") #, ['shell', 'tomato', 'beef', 'shell'])
