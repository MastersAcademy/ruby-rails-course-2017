class Homework_4

  puts 'Введите высоту (не меньше двух)'
  tower_height = gets.to_i
  a = 1

  while true do
    if tower_height <= 2
      puts 'Неверно !!!! Введите число больше чем 2'
      tower_height = gets.to_i
    else
      break
    end
  end


  while tower_height > 0 do

    arr = Array.new()

    tower_height.times do
      arr << " "
    end

    a.times do
      arr << "#"
    end

    arr.each do |x|
      print x
    end

    arr.reverse!
    print '  '

    arr.each do |x|
      print x
    end

    puts ''
    a += 1
    tower_height -= 1

  end

end
