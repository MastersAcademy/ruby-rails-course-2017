class Pyramid
  def hight (number)
    if number < 2
      puts "Pyramid hight cannot be less then 2"
    else
      number.times do |i|
        pyramid = " "* (number - i) + "#" * i
        puts pyramid + "  " + pyramid.reverse
      end
    end
  end
end

test = Pyramid.new
test.hight(5)


