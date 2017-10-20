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

p remove_url_anchor('www.codewars.com?page=1')
p remove_url_anchor('www.codewars.com#about')