require 'open-uri'
require 'net/http'
require 'json'


def getHistory(id, days_back)
  uri = URI('http://api.shopobot.com/api/v1_0/history.json')
  params = {
    :key => "qepedudequtHukugufrawumaw8d7ec",
    :id => id,
    :days => days_back
  }
  uri.query = URI.encode_www_form(params)
  req = Net::HTTP.get_response(uri)
  if req.is_a?(Net::HTTPSuccess)
    json = JSON.parse(req.body)
    new_prices = json['pricehistory']['neww']
  else
    puts 'request was not a success'
  end
  prices = []
  new_prices.each do |row|
    prices << row[1]
  end
  prices
end

def ema history, beta
  #history is an array
  ema_list = []
  count = 0
  history.each do |h|
    if count == 0
      ema_list << h
      puts ema_list.last
    else
      ema = beta.to_f*h + (1-beta)*ema_list.last
      ema_list << ema
    end
    count += 1
    ema_list
  end
end


history = getHistory(144,120)
puts "last price: #{history.last}"

ema = ema(history, 0.5)
puts "ema: #{ema.last}"
  
      
    