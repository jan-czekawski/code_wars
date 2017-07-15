# Introduction

# There is a war and nobody knows - the alphabet war!
# The letters hide in their nuclear shelters. The nuclear 
# strikes hit the battlefield and killed a lot of them.

# Task

# Write a function that accepts battlefield string and 
# returns letters that survived the nuclear strike.

# The battlefield string consists of only small letters, #,[ and ].
# The nuclear shelter is represented by square brackets []. The letters 
# inside the square brackets represent letters inside the shelter.
# The # means a place where nuclear strike hit the battlefield. If there 
# is at least one # on the battlefield, all letters outside of shelter die.
# When there is no any # on the battlefield, all letters survive (but do 
# not expect such scenario too often ;-P ).
# The shelters have some durability. When 2 or more # hit close to the 
# shelter, the shelter is destroyed and all letters inside evaporate. 
# The 'close to the shelter' means on the ground between the shelter and 
# the next shelter (or beginning/end of battlefield). The below samples
# make it clear for you.
# Example

# abde[fgh]ijk     => "abdefghijk"  (all letters survive because there is no # )
# ab#de[fgh]ijk    => "fgh" (all letters outside die because there is a # )
# ab#de[fgh]ij#k   => ""  (all letters dies, there are 2 # close to the shellter )
# ##abde[fgh]ijk   => ""  (all letters dies, there are 2 # close to the shellter )
# ##abde[fgh]ijk[mn]op => "mn" (letters from the second shelter survive, there is no # close)
# #ab#de[fgh]ijk[mn]op => "mn" (letters from the second shelter survive, there is no # close)
# #abde[fgh]i#jk[mn]op => "mn" (letters from the second shelter survive, there is only 1 # close)
# [a]#[b]#[c]  => "ac"
# [a]#b#[c][d] => "d"
# [a][b][c]    => "abc"
# ##a[a]b[c]#  => "c"

# MY SOLUTION
def alphabetWar(battlefield)
  if battlefield.count("\#") == 0
    battlefield.gsub(/[\[\]]/, '')
  elsif battlefield.count("\#") == 1
    bunks = ""
    # battlefield.gsub(/\[[^\[\]]+\]/, '')
    battlefield.gsub(/\[[^\[\]]+\]/) { |bunk| bunks += bunk }
    # battlefield.match(/\[[^\[\]]+\]/)
    bunks.gsub(/[\[\]]/, '')
    
    
    # battlefield.match(/(\[[^\[\]]+\])+/)
    # # battlefield.gsub(/.*\[(.+)\].*/, '\1').sub(/\#/, '')
    # # p battlefield.match(/.*\[(.+)\].*/)
    
    # # battlefield.gsub(/(\#|[^(\[\w+\])])/, '')
    # p battlefield.match(/(\[[^\[\]]*\])/)
    # # battlefield.match(//)
    # # p new_batt = battlefield.match(/(\[\w+\])+/)





    # new_batt = ""
    # battlefield.size.times do |x|
    #   if battlefield[x] == "["
    #     y = x
    #     until battlefield[y] == "]"
    #       y += 1
    #     end
    #     new_batt += battlefield[x+1..y-1]
    #     x = y
    #   end
    # end    
    
    # new_batt
    
  else
    new_batt, surv = "", ""
    battlefield.size.times do |x|
      if battlefield[x] == "#"
        new_batt += battlefield[x]
      elsif battlefield[x] == "["
        y = x
        until battlefield[y] == "]"
          y += 1
        end
        new_batt += battlefield[x..y]
        x = y
      end
    end
    
    
    # p alphabetWar("[cmuzkxw][xdqxjyae]mbmzbzopvpxtzwxgarsgeoacux[lawvuu]
    # blrtecccz##vvrjzhfuvojrmnzkqlajcowlqxnjywewhuipohawhsxhlzoggtgiby") #"cmuzkxwxdqxjyae"
    
    new_batt.size.times do |m|
      if new_batt[m] == "["
        n = m
        until new_batt[n] == "]"
          n += 1
        end
        
        both = (new_batt[m-1] == "#" && new_batt[n+1] == "#") && m >= 1
        right = (new_batt[n+1] == "#" && new_batt[n+2] == "#")
        left = (new_batt[m-1] == "#" && new_batt[m-2] == "#") && m >= 2
        
        unless both || right || left 
          surv += new_batt[m+1..n-1]
        end
        
      end
    end
    
    surv
    # bunker = /
    #           \[
    #             [^
    #               \[\]
    #             ]+
    #           \]
    #         /x
    # battlefield.gsub!(/
    #                 [^\#]*         # => 0 or more chars other than "#"
    #                 (#{bunker})    # => group with "bunker regex"
    #                 [^\#]*         # => 0 or more chars other than "#"
    #                 /x, '\1') # => delete any sign which isn't bomb or in a bunker
    # battlefield.gsub!(/(
    #                     (?<=\#\#)#{bunker}
    #                     |
    #                     (?<=\#)#{bunker}(?=\#)
    #                     |
    #                     #{bunker}(?=\#\#)
    #                   )/x, '')
    # battlefield.gsub(/[\#\[\]]/, '')
  end
end


# BEST SOLUTIONS

def alphabetWar(battlefield)
  nuclear_strike, shelter_first, shelter_last, nuclear_wave, result = '#', '[', ']', '', []
    unless battlefield.include?(nuclear_strike)
      result = battlefield.tr('[]','')
    else
      battlefield.each_char.with_index do |char, index|
        case char
          when shelter_first
            result << nuclear_wave and nuclear_wave = '' unless nuclear_wave.empty?
              in_shelter, last_index = [], index
              in_shelter = battlefield[index..last_index] and last_index+=1 until in_shelter[-1] == shelter_last
            result << in_shelter[1...-1]
          when nuclear_strike then nuclear_wave << char
        end
        result << nuclear_wave and nuclear_wave = '' if index == battlefield.size-1 && !nuclear_wave.empty?
      end

      result.select!.with_index do |item, index|
        next_item, prev_item = result[index+1], result[index-1]
            case index
              when 0
                !item.include?(nuclear_strike) && next_item.count(nuclear_strike) < 2
              when result.size-1
                !item.include?(nuclear_strike) && prev_item.count(nuclear_strike) < 2
              else
                (!prev_item.include?(nuclear_strike) && !item.include?(nuclear_strike) && next_item.count(nuclear_strike) < 2) ||
                (prev_item.count(nuclear_strike) < 2 && !item.include?(nuclear_strike) && !next_item.include?(nuclear_strike))
            end
      end

    result = result.join
    end
  result
end

p alphabetWar("[ikxlgq][lrxxbf][tfxnrghs]ehlxnmkciwklbxeeldyzeqvemcipcwpeyufyoooaq[tygnze]r#n") # "ikxlgqlrxxbftfxnrghstygnze"

p alphabetWar('abde[fgh]ijk') # 'abdefghijk')
p alphabetWar('ab#de[fgh]ijk') # 'fgh')
p alphabetWar('ab#de[fgh]ij#k') # '')
p alphabetWar('##abde[fgh]ijk') # '')
p alphabetWar('##abde[fgh]ijk[mn]op') # 'mn')
p alphabetWar('#abde[fgh]i#jk[mn]op') # 'mn')
p alphabetWar('[ab]adfd[dd]##[abe]dedf[ijk]d#d[h]#') # 'abijk')
p alphabetWar('##abde[fgh]') # '')  
p alphabetWar('abde[fgh]') # 'abdefgh')  
p alphabetWar('#[a]#[b]#') # '')    
p alphabetWar('[a]##[b]') # '')     
p alphabetWar('[a]a[b]') # 'aab')

p alphabetWar("ybrvwtyiouvvfkwosmqwyfd#c[godxmfc]bnmodxhoupwmagxvoowpegmjchoi[slsqcr]k##a") #Expected: "godxmfc", instead got: ""
p alphabetWar("[cmuzkxw][xdqxjyae]mbmzbzopvpxtzwxgarsgeoacux[lawvuu]blrtecccz##vvrjzhfuvojrmnzkqlajcowlqxnjywewhuipohawhsxhlzoggtgiby") #"cmuzkxwxdqxjyae"


p alphabetWar("hionzhoftnilefvkqkcfumibjwhhggolqcdvgpasqcokaczsojcdvewgjo[apcqr][bvne]h##s[ugqqna]vsjufpvpdyovfizpwigokzctyro[cgpbtx]b##i") #Expected: "apcqr", instead got: ""