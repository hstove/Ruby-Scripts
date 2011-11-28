require 'mysql2xxxx'

a = Mysql2xxxx::CSV.new :user => 'shopobot_ro', :password => 'p2Jfixq9U', :database => 'shopobot-07-26-ii.c76e00wattt7.us-east-1.rds.amazonaws.com', :execute => "select * from product where product_id "