require 'rubygems'
require 'mysql2'


client = Mysql2::Client.new(:host => "shopobot-07-26-ii.c76e00wattt7.us-east-1.rds.amazonaws.com", 
							:username => "shopobot_ro", 
							:password => "c8ei30Lp", 
							:database => "Shopobot")
	results = client.query("SELECT * FROM emails")
	results.each do |row|
		puts row
	end

