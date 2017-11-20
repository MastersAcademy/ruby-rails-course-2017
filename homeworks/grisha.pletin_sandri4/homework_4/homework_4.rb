w = gets.to_i
1.upto(w) { |i| puts " "*(w-i)+ "#"*(i*2-i)+ " "+ "#"*(i*2-i) }
