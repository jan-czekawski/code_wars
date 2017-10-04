# Write a function that when given a URL as a string, parses out just the
# domain name and returns it as a string. For example:

# domain_name("http://github.com/carbonfive/raygun") == "github" 
# domain_name("http://www.zombie-bites.com") == "zombie-bites"
# domain_name("https://www.cnet.com") == "cnet"

# MY SOLUTION
def domain_name(url)
  url.gsub(/http(s)?:\/\/(www.)?/, '').match(/[^.]+/)[0]
end

# OTHER SOLUTIONS
def domain_name(url)
  url.match(%r{//[^/]*?([^/.]+)\.[^/.]+(/|$)})[1]
end

def domain_name(url)
  URI.parse(url).host.split('.').last(2)[0]
end

def domain_name(url)
  regex = /(http|https):\/\/(?:www\.)?(?<domain_name>.*?)\./
  url.match(regex)[:domain_name]
end

def domain_name(url)
  url.match(/.*[\.\/](.*)\./)[1]
end

URL_PATTERN = %r{
  (?<http>\w+:\/\/)
  (?<subdomain>\w+\.)?
  (?<domain>[\w-]+)\.
  (?<suffix>\w+)
  (?<path>.+)?
}x
  
def domain_name(url)
  url.match(URL_PATTERN)[:domain]
end



p domain_name("http://github.com/carbonfive/raygun")# == "github" 
p domain_name("http://www.zombie-bites.com")# == "zombie-bites"
p domain_name("http://www.zombie-bites.com.cn")# == "zombie-bites"
p domain_name("https://www.cnet.com")# == "cnet"













