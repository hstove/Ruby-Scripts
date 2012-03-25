require 'open-uri'
require 'net/http'
require 'json'

@devals = []
def getDailyDevaluation id, days
  uri = URI('http://api.shopobot.com/api/v1_0/history.json')
  params = {
    :key => "qepedudequtHukugufrawumaw8d7ec",
    :id => id,
    :days => days
  }
  uri.query = URI.encode_www_form(params)
  req = Net::HTTP.get_response(uri)
  puts "trying #{id}"
  if req.is_a?(Net::HTTPSuccess)
    json = JSON.parse(req.body)
    new_prices = json['pricehistory']['neww']
    used_prices = json['pricehistory']['used']
    if new_prices.length / days > 0.9
      newNode = 0
      @diffs = []
      @delts = []
      @count = 0
      new_prices.each do |time, val|
        @count += 1
        if @count > 1
          oldNode = newNode
        end
        newNode = val
        if @count > 1
          diff = newNode - oldNode
          @diffs << diff
        end
      end
      @ema = 0
      if new_prices.last
        @percent_delta = (new_prices.last[1]-new_prices.first[1])/new_prices.last[1]*100
        count = 0
        new_prices.each do |time,val|
          if count == 0
            @ema = val
          else
            @ema = val*0.5 + @ema*0.5
          end
          count += 1
        end
      end
      @devaluation = @diffs.inject{|sum,num| sum+num }/@diffs.length if @diffs
      if @diffs.length > 1
        deval = {
          :id => id,
          :devaluation => @devaluation,
          :delta => (@percent_delta/new_prices.length),
          :ema => @ema,
          :ema_diff => new_prices.last[1] - @ema,
          :ema_delta => (new_prices.last[1]-@ema)/new_prices.last[1]*100,
          :price => new_prices.last
        }
      end
      unless @devaluation == 0
        if new_prices.length / days > 0.9
          @devals << deval
        end
      end
    end
  else
    puts 'error: bad connection'
  end
end

(6..5000).each do |num|
  getDailyDevaluation(num, 60)
  sleep 0.5
end
puts "\n\n\n-------- showing good deals ---------\n\n\n"
@sorted = @devals.sort_by {|hash| hash[:ema_delta]}
@count = 0
@sorted[0..50].each do |val|
  puts "#{@count}: #{val[:id]} - ema diff: #{val[:ema_diff]}"
  @count += 1
end
