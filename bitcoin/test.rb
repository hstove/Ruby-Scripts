require 'rubygems'
require 'mtgox'
require 'csv'
require 'net/http'


10.times do |n|
  puts MtGox.ticker.price
end
#puts MtGox.bids