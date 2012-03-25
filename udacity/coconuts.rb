rounds = 0
starter = 21
restarter = false
restartercount = 0
until rounds == 6 
  if restarter == true
    coconuts = (restartercount - 1)*4/5
    puts 'restarting'
  else
    coconuts = (starter - 1)*4/5
  end
  if coconuts % 5 == 0
    rounds = 0
    starter += 5
    restarter = false
  elsif coconuts % 5 == 1
    rounds += 1
    restartercount = coconuts
    restarter = true
    puts "rounds: #{rounds}"
  else
    rounds = 0
    starter += 5
    restarter = false
  end
end

puts starter
    