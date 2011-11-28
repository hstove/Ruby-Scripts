nums = []
i = 0

count = 10

while i < count
	i += 1
	nums << i
end

print nums
puts ''

nums.each do |n|
	b = 0
	line = []
	while b < count
		b += 1
		c = n*b
		line << c
	end
	print line
	puts ''
end


	