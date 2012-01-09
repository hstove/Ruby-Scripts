require 'CSV'
dates = []
fifa11 = []
fifa12 = []

CSV.foreach("fifa.csv", :headers => :first_row) do |row|
  puts "data.addRow([\"#{row[0]}\",#{row[1]},#{row[3]}])"
end

