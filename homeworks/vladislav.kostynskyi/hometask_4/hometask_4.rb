class Mario

  def build_piramid

  puts 'Enter the height'
  height = gets.to_i

    if height >= 2

      height.times do |t|
	    step = height -t -1
	    puts (' '*step + '#'*t) + '  ' + ('#'*t)
    end

    else
      puts 'Height should be grater than 2. Try one more time'
    end
  end
end

mario = Mario.new
mario.build_piramid