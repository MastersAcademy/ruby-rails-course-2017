puts "Enter height pyramid (not more 4 and not less 2)"
height = gets.chomp.to_i

if height < 2
  puts "too low"

elsif height > 4
  puts "too high"

else

  a = height
  b = 1

  while b <= a
    h = (" " * (a - b) + "@" * b)
    puts h + "  " + h.reverse!
    b += 1
  end
end
