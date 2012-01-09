require 'open-uri'
require 'json'

result = JSON.parse(open("http://www.newschoolers.com/ns/media/api?a=playlist&c=15&o=8&t=2&limit=10").read)

puts result