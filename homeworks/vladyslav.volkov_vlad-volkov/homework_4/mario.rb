class Pyramid
  
  def input_height
    height_of_pyramid = 0
    puts 'Please input height of pyramid'

    while height_of_pyramid == 0 || height_of_pyramid == 1
     height_of_pyramid = gets.chomp
      height_of_pyramid = height_of_pyramid.to_i
      if height_of_pyramid == 0 
        puts 'Height is not correct. Please input another value'
      elsif height_of_pyramid == 1 
        puts 'Height of pyramid must be 2 or more'
     end
    end
    return height_of_pyramid
  end

  def print_pyramid(height)
    n = height-1
    array_pyramid = Array.new
    array_pyramid_str = String.new
    
    height.times do
      array_pyramid_str = ''
      spaces = ' '*n
      symbols = '#'*(height - n)
      array_pyramid_str += spaces
      array_pyramid_str += symbols
      array_pyramid_str += '  '
      array_pyramid_str += symbols
      array_pyramid_str += spaces
      array_pyramid << array_pyramid_str
      n -=1
    end
    array_pyramid.each do |array_pyramid_str| 
      puts array_pyramid_str
    end
  end

end

pyramid = Pyramid.new
height = pyramid.input_height
pyramid.print_pyramid(height)


