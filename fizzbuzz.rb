def checkfizz(i)
  print i
  if i % 3 == 0
    print '- Fizz'
    if i % 5 == 0
      print 'Buzz'
    end
  elsif i % 5 == 0
    print '- Buzz'
  end
  puts ''
end

for i in (1...100)
  checkfizz(i)
end