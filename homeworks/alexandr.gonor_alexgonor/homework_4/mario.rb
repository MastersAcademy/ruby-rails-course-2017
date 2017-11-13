def mario(steps)
  kostil = steps+1      # I fill bad about this:(
  (kostil).times do |i|
    p ' '*(steps-i) + '#'*i + '  ' + '#'*i
  end
end
puts "Give me number of steps"
number = gets
mario(number.to_i)
