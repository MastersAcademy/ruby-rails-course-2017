def piramida(height = 1, char = "#")
  if height < 2
    return puts "height shold be >=2"
  else
    height.times do |time|
      a = (" ," * (height - (time + 1))).split(",") + (char.split) * (time + 1)
      puts a.join() + "  " + a.reverse.join()
    end
  end
end
puts "enter any integer"
height = gets.chomp.to_i
puts "enter any character"
char = gets.chomp.to_s
piramida(height, char)
