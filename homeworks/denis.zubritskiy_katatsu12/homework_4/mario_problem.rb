puts 'Enter height pyramid (not more 10 and not less 2)'
height = gets.chomp.to_i

MIN_PYRAMID_HEIGHT = 2
MAX_PYRAMID_HEIGHT = 10

SIGN = '@'.fereeze

if height < MIN_PYRAMID_HEIGHT
  puts 'too low'

elsif height > MAX_PYRAMID_HEIGHT
  puts 'too high'

else

  b = 1

  while b <= height
    h = ('  ' * (height - b) + SIGN * b)
    puts h + '  ' + h.reverse!
    b += 1
  end
end
