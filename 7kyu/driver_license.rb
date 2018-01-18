# In the United Kingdom, the driving licence is the official document 
# which authorises its holder to operate various types of motor vehicle
# on highways and some other roads to which the public have access. 
# In England, Scotland and Wales they are administered by the Driver 
# and Vehicle Licensing Agency (DVLA) and in Northern Ireland by the 
# Driver & Vehicle Agency (DVA). A driving licence is required in the 
# UK by any person driving a vehicle on any highway or other road 
# defined in s.192 Road Traffic Act 1988[1] irrespective of ownership 
# of the land over which the road passes, thus including many which 
# allow the public to pass over private land; similar requirements apply
# in Northern Ireland under the Road Traffic (Northern Ireland) 
# Order 1981. (Source Wikipedia)
 
# Driving
# Task

# 	The UK driving number is made up from the personal details of the driver. 
# 	The individual letters and digits can be code using the below information
 
# Rules

# 	1–5: The first five characters of the surname (padded with 9s if less 
# 	than 5 characters)

# 6: The decade digit from the year of birth (e.g. for 1987 it would be 8)

# 7–8: The month of birth (7th character incremented by 5 if driver is 
# female i.e. 51–62 instead of 01–12)

# 9–10: The date within the month of birth

# 11: The year digit from the year of birth (e.g. for 1987 it would be 7)

# 12–13: The first two initials of the first name and middle name, padded 
# with a 9 if no middle name

# 14: Arbitrary digit – usually 9, but decremented to differentiate drivers with
# the first 13 characters in common. We will always use 9

# 15–16: Two computer check digits. We will always use "AA"
 
# Your task is to code a UK driving license number using an Array of data.
# The Array will look like

# data = ["John","James","Smith","01-Jan-2000","M"]
# Where the elements are as follows

# 	0 = Forename

# 1 = Middle Name (if any)

# 2 = Surname

# 3 = Date of Birth (In the format Day Month Year, this could include the
# full Month name or just shorthand ie September or Sep)

# 4 = M-Male or F-Female
 
# You will need to output the full 16 digit driving license number.



# MY SOLUTION
def driver(data, str=["9AA"])
  mths = { "Jan" => "01", "Feb" => "02", "Mar" => "03", "Apr" => "04", "May" => "05",
           "Jun" => "06", "Jul" => "07", "Aug" => "08", "Sep" => "09", "Oct" => "10",
           "Nov" => "11", "Dec" => "12" }
  str.unshift(data[1][0] ? data[1][0] : 9)
  str.unshift(data[0][0])
  str.unshift(data[3].match(/\d\z/))
  str.unshift(data[3].match(/\A\d\d/))
  mths.each do |mon, dat|
    if mon == data[3].match(/[a-z]{3}/i).to_s
      str.unshift(data[4] == "M" ? dat : dat.to_i + 50 )
    end
  end
  str.unshift(data[3].match(/\d\d\z/).to_s[0])
  name = data[2]
  
  if name.size >= 5
    name = name[0..4]
  else
    until name.size == 5
      name << "9"
    end
  end
  
  str.unshift(name.upcase)
  str.join
end

# ["John","James","Smith","01-Jan-2000","M"]
#     p driver(data) #, "SMITH001010JJ9AA")

def driver(data)
  str = ""
  mths = { "Jan" => "01", "Feb" => "02", "Mar" => "03", "Apr" => "04", "May" => "05",
         "Jun" => "06", "Jul" => "07", "Aug" => "08", "Sep" => "09", "Oct" => "10",
         "Nov" => "11", "Dec" => "12" }
  
  
  str += data[2][0..4].upcase
  str += "9" until str.size == 5
  
  # MORE INTERESTING APPROACH
  /(?<day>\d\d)\-(?<mon>[a-z]{3})[a-z]*\-\d\d(?<dec>\d)(?<year>\d)/i =~ data[3]
  str += dec
  str += data[4] == "M" ? mths[mon] : (mths[mon].to_i + 50).to_s
  str += day + year + data[0][0]
  
  # SIMPLER APPROACH
  # str += data[3][-2]
  # str += data[4] == "M" ? mths[data[3][3..5]] : (mths[data[3][3..5]].to_i + 50).to_s
  # str += data[3][0..1] + data[3][-1] + data[0][0]
  
  
  str += data[1].empty? ? "9" : data[1][0]
  str += "9AA"
  
  
  
end

# BEST SOLUTIONS
def driver(data)
  h = {"Jan" => "01","Feb" => "02","Mar" => "03","Apr" => "04",
"May" => "05","Jun" => "06","Jul" => "07","Aug" => "08",
"Sep" => "09","Oct" => "10","Nov" => "11","Dec" => "12"}

  mob = h[data[3].split("-")[1][0,3]].split("")
  mob = (data[4] == "M" ? mob.join : (mob[0].to_i + 5).to_s + mob[1])

  ("%-5s" % data[2][0,5]).gsub(" ","9").upcase + 
    data[3][-2,1].to_s + mob +
    data[3].split("-")[0] + data[3][-1,1] +
    data[0][0,1]  + (data[1][0,1].empty? ?  "9" : data[1][0,1]) + "9" + "AA"
end

def driver(data)
  fst = ("%-5s" % data[2].slice(0,5)).tr("\s","9").upcase
  a = Date.parse(data[3])
  y1,y2 = a.year.to_s.chars.last(2)
  m = a.month.to_i + (data[-1] == "F" ? 50 : 0)
  d = a.day
  fn, mn = data[0..1].map{|i| i = i.empty? ? "9" : i[0]}
  "#{fst}#{y1}#{"%02d" % m}#{"%02d" % d}#{y2}#{fn}#{mn}9AA"
end

require 'date'

def driver(data)
  surname(data[2]) +
    birth_decade(data[3]) +
    birth_month(data[3], data[4]) +
    birth_day_in_month(data[3]) +
    birth_year_digit(data[3]) +
    initials(data[0], data[1]) +
    arbitrary() +
    checkdigits()
end

def surname(name)
  name[0..4].upcase.ljust(5, '9')
end

def birth_decade(birthday)
  birthday[-2]
end

def birth_month(birthday, gender)
  month = Date::ABBR_MONTHNAMES
    .index(birthday[3..5])
    .to_s
    .rjust(2, '0')
  if gender == 'F'
    return (month[0].to_i + 5).to_s + month[1]
  end
  return month
end

def birth_day_in_month(birthday)
  birthday[0..1]
end

def birth_year_digit(birthday)
  birthday[-1]
end

def initials(forename, middlename)
  forename[0] + middlename[0..0].rjust(1, '9')
end

def arbitrary()
  '9'
end

def checkdigits()
  'AA'
end

def driver(data)

  require 'date'

  if data[2].length >= 5
    a = data[2].upcase.slice(0,5)
  else
    a = data[2].upcase << '9'*(5 - data[2].length)
  end

  b = data[3].slice(-2)

  t = data[3]
  if data[4] == "F"
    c = DateTime.parse(t).strftime("%m").to_i + 50
  else
    c = DateTime.parse(t).strftime("%m")
  end

  d = data[3].slice(0,2)

  e = data[3].slice(-1)

  if data[1].empty?
    f = data[0].slice(0) << '9'
  else
    f = data[0].slice(0) << data[1].slice(0)
  end

  # license = "#{a}#{b}#{c}#{d}#{e}#{f}9AA"
  "#{a}#{b}#{c}#{d}#{e}#{f}9AA"

end


data = ["John","James","Smith","01-Jan-2000","M"]
    p driver(data) #, "SMITH001010JJ9AA")


data = ["Johanna","","Gibbs","13-Dec-1981","F"]
    p driver(data) #, "GIBBS862131J99AA")


data = ["Andrew","Robert","Lee","02-September-1981","M"]

    p driver(data) #, "LEE99809021AR9AA")
