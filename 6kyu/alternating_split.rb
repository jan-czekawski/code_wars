# For building the encrypted string:
# Take every 2nd char from the string, then the other chars, that 
# are not every 2nd char, and concat them as new String.
# Do this n times!

# Examples:

# "This is a test!", 1 -> "hsi  etTi sats!"
# "This is a test!", 2 -> "hsi  etTi sats!" -> "s eT ashi tist!"
# Write two methods:

# def encrypt(text, n)
# def decrypt(encrypted_text, n)
# For both methods:
# If the input-string is null or empty return exactly this value!
# If n is <= 0 then return the input text.

# This kata is part of the Simple Encryption Series:
# Simple Encryption #1 - Alternating Split
# Simple Encryption #2 - Index-Difference
# Simple Encryption #3 - Turn The Bits Around
# Simple Encryption #4 - Qwerty

# Have fun coding it and please don't forget to vote and rank this kata! :-)

# MY SOLUTIONS
def encrypt(text, n)
  n.times do
    text = text.chars
    odds = text.select.with_index { |let, ix| ix.odd? }.join("")
    evens = text.reject.with_index { |let, ix| ix.odd? }.join("")
    text = odds + evens
  end
  text
end

def decrypt(enc_txt, n)
  dec_txt = Array.new(enc_txt.size)
  dec_last = dec_txt.size - 1
  n.times do
    enc_txt = enc_txt.chars
    (0..dec_last).each do |ix|
      dec_txt[ix] = enc_txt.shift if ix.odd?
    end
    (0..dec_last).each do |ix|
      dec_txt[ix] = enc_txt.shift if ix.even?
    end
    enc_txt = dec_txt.join("")
  end
  enc_txt
end

# BEST SOLUTIONS
def encrypt(text, n)
  return text if n <= 0
  encrypt(text.scan(/(.)(.)?/).transpose.reverse.join, n-1)
end

def decrypt(text, n)
  return text if n <= 0
  c, s = text.chars, text.size/2
  decrypt(c.drop(s).zip(c.take s).join, n-1)
end


def encrypt text, n
  n.times.reduce(text){|y,_|y.scan(/(.)(.)?/).transpose.reverse.join} rescue text
end

def decrypt text, n
  n.times.reduce(text){|y,_|y.scan(/(?=.{#{y.size/2}}(.))(.)/).join[0...y.size]} rescue text
end


def encrypt(text, n)
  return text if n <=0 or text.nil?
  n.times do
    list = text.scan /(.)(.?)/
    o1 = []
    o2 = []
    list.map do|x,y| 
      o1 << x
      o2 << y
    end
    text = o2.join + o1.join
  end
  return text
end

def decrypt(encrypted_text, n)
  return encrypted_text if n <=0 or encrypted_text.nil?
  m = encrypted_text.size/2
  n.times do
    text = []
    m.times do |i|
      text << encrypted_text[m+i]
      text << encrypted_text[i]
    end
    text << encrypted_text[-1] if encrypted_text.size%2 == 1
    encrypted_text = text.join
  end
  return encrypted_text
end


def encrypt(text, n)
  return text if text.nil? || text.empty?
  while n > 0
    left, right = '', ''
    text.each_char.with_index do |char, idx|
      idx.odd? ? left << char : right << char
    end
    text = left + right
    n -= 1
  end
  text
end

def decrypt(text, n)
  return text if text.nil? || text.empty?
  half_idx = text.size / 2
  while n > 0
    left, right = text[0...half_idx].chars, text[half_idx..-1].chars
    text = right.zip(left).join
    n -= 1
  end
  text
end


p encrypt("This is a test!", 0)# "This is a test!")
p encrypt("This is a test!", 1)# "hsi  etTi sats!")
p encrypt("This is a test!", 2)# "s eT ashi tist!")
p encrypt("This is a test!", 3)# " Tah itse sits!")
p encrypt("This is a test!", 4)# "This is a test!")
p encrypt("This is a test!", -1)# "This is a test!")
p encrypt("This kata is very interesting!", 1)# "hskt svr neetn!Ti aai eyitrsig")
p decrypt("This is a test!", 0)# "This is a test!")
p decrypt("hsi  etTi sats!", 1)# "This is a test!")
p decrypt("s eT ashi tist!", 2)# "This is a test!")
p decrypt(" Tah itse sits!", 3)# "This is a test!")
p decrypt("This is a test!", 4)# "This is a test!")
p decrypt("This is a test!", -1)# "This is a test!")
p decrypt("hskt svr neetn!Ti aai eyitrsig", 1)# "This kata is very interesting!")
p encrypt("", 0)# "")
p decrypt("", 0)# "")
