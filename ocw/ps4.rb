def nestEggFixed (salary, save, growthRate, years)
  eggs=[]
  years.times do |key|
    if key == 0
      eggs.push((salary * save))
    else
      eggs.push((eggs[key-1]*(growthRate+1)) + salary * save)
    end
  end
  puts eggs.join ' , '
end
growthRates = [0.03, 0.04, 0.05, 0, 0.03]
growthRates2 = [0.10, 0.05, 0.0, 0.05, 0.01]
def nestEggVariable (salary, save, growthRates)
  eggs=[]
  growthRates.length.times do |key|
    if key == 0
      eggs.push((salary. * save))
    else
      eggs.push((eggs[key-1]*(growthRates[key]+1)) + salary * save)
    end
  end
  eggs
end

def postRetirement (savings, growthRates, expenses)
  eggs=[]
  growthRates.length.times do |key|
    if key == 0
      eggs.push(savings*(growthRates[key]+1) - expenses)
    else
      eggs.push((eggs[key-1]*(growthRates[key]+1)) - expenses)
    end
  end
  eggs
end

def findMaxExpenses(salary, save, preRetireRates, postRetirementRates, eps)
  savings = nestEggVariable(salary, save, preRetireRates).last
  curExpenses = savings/postRetirementRates.length
  abso = 10
  while abso.abs > eps
    print "checking #{curExpenses} - "
    abso = postRetirement(savings, postRetirementRates, curExpenses).last
    puts abso
    if abso.abs < eps
      puts "found epsilon of #{abso} with expenses of #{curExpenses}"
    end
    if abso < eps*-1
      break
    end
    curExpenses += 0.001
  end
end

findMaxExpenses(10000, 0.1, growthRates, growthRates2, 0.01)

#nestEggFixed(10000, 0.1, 0.15, 5)
#nestEggVariable(10000, 0.1, growthRates)
#postRetirement(100000, growthRates2, 20000)











