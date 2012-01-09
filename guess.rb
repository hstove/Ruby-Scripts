@min = 1
@max = 100
puts 'think of a @number'
@num = gets.to_i

@guess = 0
@count = 0

def try
  @count += 1
  @guess = ((@min + @max)/2).to_i
  if @guess == @num
    puts "@guessing... #{@guess}"
    puts "winner! it took #{@count} tries."
  elsif @guess < @num
    puts "@guessing... #{@guess}"
    puts 'nope. higher'
    @min = @guess
    try
  elsif @guess > @num
    puts "@guessing... #{@guess}"
    puts 'nope. lower'
    @max = @guess
    try
  end
end

while @guess != @num
   try
end
  
