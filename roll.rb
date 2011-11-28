def roll_first(name)
	d1 = (rand*6).ceil
	d2 = (rand*6).ceil
	$r1 = d1 + d2
	puts "Hello #{name} here is your roll."
	sleep(1)
	puts "[#{d1},#{d2}]"
	sleep(1)
end

def roll_second(name2)
	d3 = (rand*6).ceil
	d4 = (rand*6).ceil
	$r2 = d3 + d4
	puts "Hello #{name2} here is your roll."
	sleep(1)
	puts "[#{d3},#{d4}]"
	sleep(1)
end

def winner(name1, name2)
	if $r1>$r2
		puts name1 + ", you are the winner! Play again?"
	elsif $r2>$r1
		puts name2 + ", you are the winner! Play again?"
	elsif $r2 = $r1
		puts 'Tie game. Play again?'
	else 
		puts 'error'
	end
end

def play
	puts 'Enter name 1:'
	name1 = gets.chomp.capitalize
	puts 'Enter name 2:'
	name2 = gets.chomp.capitalize
	roll_first(name1)
	roll_second(name2)
	winner(name1, name2)
	again = gets.chomp
	
	if again == 'y'
		play
	else
		puts 'Bye!'
	end
end

play



	