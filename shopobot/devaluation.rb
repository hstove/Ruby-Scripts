require 'open-uri'
require 'net/http'
require 'CSV'

def getDailyDevaluation id
  uri = URI('http://shopobot.com/admin/csv-export')
  params = {
    :p => id
  }
  uri.query = URI.encode_www_form(params)
  req = Net::HTTP.get_response(uri)
  puts req.body
  if req.is_a?(Net::HTTPSuccess)
    csv = CSV.read(req.body)
    puts csv
  end
end

getDailyDevaluation 124