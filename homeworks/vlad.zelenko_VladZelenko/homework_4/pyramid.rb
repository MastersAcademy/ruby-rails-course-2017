class Pyramid
	def hightPyramid (hight)
		if hight < 2
			puts "Піраміда не може бути нижче 2"
		else
			a = 0
			while a <= hight do
				pyramidSide = " " * (hight - a) + "A" * a
				puts pyramidSide + "  "+ pyramidSide.reverse
				a += 1
			end
		end
	end
end

mario = Pyramid.new
mario.hightPyramid(35)


=begin
puts "Введіть висоту піраміди"
	hight = gets.chomp.to_i
	if hight < 2
			puts "Піраміда не може бути нижче 2"
	else
		a = 0
		while a <= hight do
			pyramidSide = " " * (hight - a) + "A" * a
			puts pyramidSide + "  "+ pyramidSide.reverse
			a += 1
		end
	end
=end