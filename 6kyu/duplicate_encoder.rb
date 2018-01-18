# The goal of this exercise is to convert a string 
# to a new string where each character in the new 
# string is '(' if that character appears only once 
# in the original string, or ')' if that character 
# appears more than once in the original string. Ignore capitalization
# when determining if a character is a duplicate.

# Examples:

# "din" => "((("

# "recede" => "()()()"

# "Success" => ")())())"

# "(( @" => "))(("

# MY SOLUTION
def duplicate_encode(word)
  word = word.downcase
  word.chars
      .map { |let| let = word.count(let) > 1 ? ")" : "(" }
      .join 
end

def duplicate_encode(word)
  count = Hash.new(0)
  letters = word.downcase.chars
  letters.each { |let| count[let] += 1 }
  letters.map { |let| count[let] > 1 ? ")" : "(" }.join
end

# BEST SOLUTION
def duplicate_encode(word)
  chars = word.downcase.chars
  count = chars.each_with_object(Hash.new(0)) { |char, count| count[char] += 1 }
  chars.map { |char| count[char] > 1 ? ")" : "(" }.join
end

def duplicate_encode(word)
  word.downcase!
  h = Hash.new(0)
  word.chars.each do |chr|
    h[chr] += 1
  end
  word.chars.map do |chr|
    if h[chr] == 1
      '('
    else
      ')'
    end
  end.join
end

def duplicate_encode(word)
  word.downcase.gsub(/./) do |char|
    word.downcase.count(char.downcase) > 1 ? ")" : "("
  end
end

def duplicate_encode(word)
  word.downcase!
  word.split('').map {|c| word.count(c) > 1 ? ')' : '(' }.join
end


def duplicate_encode(word)
  Code.new(word).encode
end

class Code

  def initialize(word)
    @word = word
  end

  def encode
    @codedword = []
    @singular =  "("
    @plural = ")"

    @word.downcase!
    @word.split("").each do | letter |
      if @word.count(letter) > 1
        letter.replace @plural
      else
        letter.replace @singular
      end

      @codedword << letter
    end
    
    return @codedword.join
  end
end

p duplicate_encode("din")#"(((")
p duplicate_encode("recede")#"()()()")
p duplicate_encode("Success")#")())())","should ignore case")
p duplicate_encode("(( @")#"))((")

# require "benchmark"

# n = 1_000
# Benchmark.bm do |x|
#   x.report { n.times { duplicate_encode1("Lorem ipsum dolor sit amet, insolens facilisis referrentur et sed. Ius quod posse dicam no, stet vide ex vis. Ut nam vidisse mentitum temporibus, ius habeo voluptaria at, ea volutpat corrumpit similique his. Qui ei erat labores molestiae, sed id meis expetenda quaerendum.

# Cu graece elaboraret vis, duo ea torquatos mnesarchum, ridens possim mel ea. Cum eu inani delenit, id vix accumsan perpetua. Facete latine instructior mea ei, an case alienum mediocritatem nec. Pri ex fugit maiorum denique, hinc iudicabit disputationi qui et, adipisci erroribus gloriatur et nam.

# Eu elit meis cum. Falli quidam et nam. Platonem interpretaris ei pro, an pertinax repudiandae qui. Discere hendrerit sea ex, cu veri vidisse oportere vim, an sit possit consulatu intellegat. Sint ancillae eu sea, velit dolore aperiri vix an, ex has graeco propriae nominavi. Ea vix tamquam constituto, an oratio rationibus percipitur pri.

# Tota percipit ius ut, no atqui invenire scriptorem pri, no imperdiet delicatissimi sit. Sit zril explicari et. Id sale malorum ius, falli voluptatibus in sit, in mel esse illum. At sed vero populo probatus, vidisse apeirian ocurreret eum ex, causae reprimique sea ei. An detracto recteque liberavisse vis, an usu modo adversarium comprehensam. Eros urbanitas mel ea.

# Posse semper ullamcorper quo eu. Nominati quaerendum duo in, no pro alii falli populo, sea eu eleifend indoctum. Duo laudem alienum reprimique te. Ei nihil eirmod delicata vis. Saperet volumus ex nam.") } }
#   x.report { n.times { duplicate_encode2("Lorem ipsum dolor sit amet, insolens facilisis referrentur et sed. Ius quod posse dicam no, stet vide ex vis. Ut nam vidisse mentitum temporibus, ius habeo voluptaria at, ea volutpat corrumpit similique his. Qui ei erat labores molestiae, sed id meis expetenda quaerendum.

# Cu graece elaboraret vis, duo ea torquatos mnesarchum, ridens possim mel ea. Cum eu inani delenit, id vix accumsan perpetua. Facete latine instructior mea ei, an case alienum mediocritatem nec. Pri ex fugit maiorum denique, hinc iudicabit disputationi qui et, adipisci erroribus gloriatur et nam.

# Eu elit meis cum. Falli quidam et nam. Platonem interpretaris ei pro, an pertinax repudiandae qui. Discere hendrerit sea ex, cu veri vidisse oportere vim, an sit possit consulatu intellegat. Sint ancillae eu sea, velit dolore aperiri vix an, ex has graeco propriae nominavi. Ea vix tamquam constituto, an oratio rationibus percipitur pri.

# Tota percipit ius ut, no atqui invenire scriptorem pri, no imperdiet delicatissimi sit. Sit zril explicari et. Id sale malorum ius, falli voluptatibus in sit, in mel esse illum. At sed vero populo probatus, vidisse apeirian ocurreret eum ex, causae reprimique sea ei. An detracto recteque liberavisse vis, an usu modo adversarium comprehensam. Eros urbanitas mel ea.

# Posse semper ullamcorper quo eu. Nominati quaerendum duo in, no pro alii falli populo, sea eu eleifend indoctum. Duo laudem alienum reprimique te. Ei nihil eirmod delicata vis. Saperet volumus ex nam.") } }
# end
