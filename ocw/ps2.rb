a = 6 
b = 9
c = 12

largest = 0
limit = 200
solutions = []
counter = 0

(1...limit).each do |n|
  if counter == [a,b,c].min
    break
  end
  (0...(n/a+1)).each do |x|
    (0...(n/b+1)).each do |y|
      (0...(n/c+1)).each do |z|
        if x*a + y*b + z*c == n
          unless solutions.include? n
            solutions.push(n)
            puts "#{n}"#" = #{a}(#{x}) + #{b}(#{y}) + #{c}(#{z})"
          end
          unless solutions.include?(solutions.max-1)
            largest = solutions.max-1
            counter=0
          else
            counter += 1
          end
        end
      end
    end
  end
end

print solutions.join(',')
puts ''
print largest