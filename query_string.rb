# Query string is a way to serialize object, which is used in HTTP
# requests. You may see it in URL:

# codewars.com/kata/search/?q=querystring
# The part q=querystring represents that parameter q has value
# querystring. Also sometimes querystring used in HTTP POST body:

# POST /api/users
# Content-Type: application/x-www-form-urlencoded

# username=warrior&kyu=1&age=28
# The string username=warrior&kyu=1&age=28 represents an entity 
# (user in this example) with username equals warrior, kyu 
# equals 1 and age equals 28. The entity may be represented as object:

# {
#   "username": "warrior",
#   "kyu": 1,
#   "age": 28
# }
# Sometimes there are more than one value for property:

# {
#   "name": "shirt",
#   "colors": [ "white", "black" ]
# }
# Then it represents as repeated param:

# name=shirt&colors=white&colors=black
# So, your task is to write a function that convert an object to query string:

# to_query_string({ "bar": [ 2, 3 ], "foo": 1 }) # => "bar=2&bar=3&foo=1"
# Next you may enjoy kata Objectify a URL Query String.


# MY SOLUTION
def to_query_string(data)
  data.sort.to_h.map do |key, val|
    val.is_a?(Array) ? val.map { |v| "#{key}=#{v}"}.join("&") : "#{key}=#{val}" 
  end.join("&")
end



p to_query_string({"a"=>8, "8"=>"foo", "b"=>"b", "h"=>"foo", "7"=>"g", "1"=>6, "c"=>5, "CodeWars"=>"h", "5"=>"bar"})
# "1=6&5=bar&7=g&8=foo&CodeWars=h&a=8&b=b&c=5&h=foo"

p to_query_string({"bar"=>2, "foo"=>1})#, "bar=2&foo=1"
p to_query_string({"bar"=>[2, 4], "foo"=>[1, 3]})#, "bar=2&bar=4&foo=1&foo=3"
p to_query_string({"a"=>"Z", "b"=>"Y", "c"=>"X", "d"=>"W", "e"=>"V", "f"=>"U", "g"=>"T"})#, "a=Z&b=Y&c=X&d=W&e=V&f=U&g=T"