# Pyramid
class Pyramid
  def input_height
    height_of_pyramid = 0
    puts 'Please input height of pyramid'
    while height_of_pyramid < 2
      height_of_pyramid = gets.chomp.to_i
      if height_of_pyramid < 2
        puts 'Input is not number or less then 2. Please input another value'
      end
    end
    height_of_pyramid
  end

  def print_pyramid(height)
    n = height - 1
    height.times do
      puts ' ' * n + '#' * (height - n) + '  ' + '#' * (height - n) + ' ' * n
      n -= 1
    end
  end
end

pyramid = Pyramid.new
pyramid.print_pyramid(pyramid.input_height)
