def start
	puts "Do you want to enter a new grade? (Y/N)"
	response = gets.chomp
	if response == 'y'
		get_grade
	else
		puts 'have a good day, fuck.'
	end
end

def get_grade
	puts 'Enter your grade out of 100'
	grades = Array.new
	grades << 88 << 90 << 95 << 100 #initial grades
	grade = gets.to_f
	grades << grade
	result = grades.inject{ |sum, el| sum + el }.to_f / grades.size
	puts 'Your average is ' + result.to_s
	puts 'scores: ' + grades.to_s
	get_grade
end



get_grade

