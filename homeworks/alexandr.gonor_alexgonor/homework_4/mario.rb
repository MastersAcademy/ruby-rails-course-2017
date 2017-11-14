def mario(steps)
  kostil = steps + 1 # I fill bad about this:(
  kostil.times do |i|
    p ' ' * (steps - i) + '#' * i + '  ' + '#' * i
  end
end

def welcome
  puts 'Give me number of steps'
  number = gets.chomp
  if (1..20).cover?(number.to_i)
    mario(number.to_i)
  else
    puts "It's too high for Mario..."
    return welcome
  end
end
puts welcome
