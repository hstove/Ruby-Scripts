

def countSubStringMatch(target, key)
  count = 0
  index = 0
  until index == target.length do
    ab = target[index...target.length]
    #puts index
    if ab.match /#{key}/
      index = target.index(key, index)
      count += 1
    end
    index += 1
  end
  count.to_s + " matches"
end

def subStringMatchExact(target, key)
  matches = []
  index = 0
  until index == target.length do
    a = target[index...target.length]
    if a.index(key, index)
      index = a.index(key, index)
      if matches.empty?
        matches.push(index)
      else
        matches.push((matches.last.to_i+index+1))
      end
    end
    index +=1
  end
  matches.join(', ')
end
@target = 'atgacatgcacaagtatgcat'
@key = 'at'

puts countSubStringMatch(@target,@key)
                         
puts subStringMatchExact(@target,@key)
    