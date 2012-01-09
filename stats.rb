require 'CSV'
require 'statsample'
require 'reportbuilder'
# create arrays
type = []
nav = []
y = []
er = []
rank = []

## read CSV and grab vectors
arr = CSV.read("Data-Table_1.csv", :headers => :first_row)
arr.each do |row|
  #comment out the if block if you want to do regression for all investment types
  #if row[1] == "0"
    nav << row[2].to_f
    y << row[3].to_f
    er << row[4].to_f
    rank << row [5].to_f
  #end
end

#create vectors
type = type.to_scale
nav = nav.to_scale
y = y.to_scale
er = er.to_scale
rank = rank.to_scale

#create dataset 
ds = { 'nav'=>nav, 'y'=>y, 'er'=>er}.to_dataset
lr=Statsample::Regression.logit(ds, 'y')

#give it a name
lr.name = "expense ratio to return"
file = File.open("report-simple", "a+")
puts(lr.summary)


