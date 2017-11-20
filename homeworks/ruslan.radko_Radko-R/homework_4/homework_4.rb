 puts "Let's build a pyramid! What height do you want? Pleasure enter a number."
 number = gets.chomp.to_i
 x = 1
 while x <= number
   string = (" " * (number - x) + "#" * x)
   puts string + "  " + string.reverse
   x += 1
 end
