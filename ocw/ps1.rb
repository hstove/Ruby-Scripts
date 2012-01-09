# the assignment is to find the 1000th prime number.

@primes = [2]
@n=3

def summarize
  sum = 0
  @primes.each do |p|
    sum += Math.log(p)
  end
  #puts "for number #{@primes.last} sum of logs is #{sum} with ratio #{sum/@primes.last}"
end

def is_prime? n
  range = (2...(n/2))
  @prime = true
  range.each do |r|
    @prime = false if n % r == 0
    break if n % r == 0
  end
  if @prime == true
    puts "#{n} is prime!!!"
    @primes.push(@n)
    summarize
  end
end


until @primes.length == 1000 do
  is_prime? @n
  @n += 2
end

summarize
puts @primes.last.to_s + "is the 1000th prime number."
    
      
