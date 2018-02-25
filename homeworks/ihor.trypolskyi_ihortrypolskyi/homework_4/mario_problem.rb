def piramida(height = 1, char = '#')
  if height < 2
    puts 'integer should be >=2'
  else
    height.times do |time|
      a = (' ' * (height - (time + 1))) + char * (time + 1)
      puts a + '  ' + a.reverse
    end
  end
end

puts 'enter any character'
char = gets.chomp.to_s
puts 'enter integer >= 2'
height = gets.chomp.to_i
piramida(height, char)
