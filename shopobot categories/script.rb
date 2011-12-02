require 'csv' 

puts "<select name=\"category\">"

CSV.foreach("categories.csv", :headers => :first_row) do |row|
  puts "<option value=\"#{row[0]}\">#{row[1]} - #{row[0]}</option>"
end

puts "</select>"
  
  