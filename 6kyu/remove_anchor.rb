# Complete the function/method so that it returns the url with anything after the anchor (#) removed.

# Examples:

# # returns 'www.codewars.com'
# remove_url_anchor('www.codewars.com#about')

# # returns 'www.codewars.com?page=1' 
# remove_url_anchor('www.codewars.com?page=1')

# MY SOLUTION
def remove_url_anchor(url)
  suburl = url[/[^#]+/]
  return suburl
end

# BEST SOLUTIONS
def remove_url_anchor(url)
  url.split('#').first
end

def remove_url_anchor(url)
  url.split('#')[0]
end

def remove_url_anchor(url)
  url.split("#")[0]
end

def remove_url_anchor(url)
  url.gsub(/#.*/, '')
end

p remove_url_anchor('www.codewars.com?page=1') # 'www.codewars.com'
p remove_url_anchor('www.codewars.com#about') # 'www.codewars.com'