require 'CSV'
require 'open-uri'
stocks = ['AAPL']
format = ['k1']

url ="http://finance.yahoo.com/d/quotes.csv"

#query = url + '?s=' + stocks.join("+") + '&f=' + format.join
query = 'http://finance.yahoo.com/d/quotes.csv?s=MSFT&f=snd1l1yr'


CSV.new(open(query)).each do |row|
  print row
end
