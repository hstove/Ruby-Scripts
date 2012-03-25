require 'open-uri'
require 'net/http'
require 'json'
require 'statsample'

def regression id, days
  uri = URI('http://api.shopobot.com/api/v1_0/history.json')
  params = {
    :key => "qepedudequtHukugufrawumaw8d7ec",
    :id => id,
    :days => days
  }
  uri.query = URI.encode_www_form(params)
  req = Net::HTTP.get_response(uri)
  if req.is_a?(Net::HTTPSuccess)
    json = JSON.parse(req.body)
    new_prices = json['pricehistory']['neww']
    ema = new_prices[5][1]
    @ema_diffs = []
    @prices = []
    @ratechanges = []
    @newlows = []
    @times = []
    beta = 0.5
    count = 0
    new_prices[5..new_prices.length-5].each do |time,value|
      ema = ema*beta+value*(1-beta)
      #puts "ema: #{ema}"
      @ema_diffs << (value - ema)
      #puts "price: #{value}"
      @prices << value
      #puts "rate of change: #{value - new_prices[count+4][1]}"
      @ratechanges << value - new_prices[count+4][1]
      lowest = new_prices[count+6][1]
      new_prices[count+7..count+11].each do |time,value|
        if value < lowest
          lowest = value
        end
      end
      #puts "lowest: #{lowest}"
      @newlows << lowest
      @times << count
      count += 1
    end
    
    ema = @ema_diffs.to_scale
    price = @prices.to_scale
    rate = @ratechanges.to_scale
    low = @newlows.to_scale
    time = @times.to_scale
    
    ds = { 'ema'=>ema, 'price'=>price, 'rate'=>rate, 'time'=>time, 'low'=>low}.to_dataset
    single=Statsample::Regression::Simple.new_from_dataset(ds, 'time','low')
    multiple=Statsample::Regression.multiple(ds,'low')
    puts single.summary
    puts multiple.summary
    puts multiple.se_estimate
    
  end
end

regression 3528, 360