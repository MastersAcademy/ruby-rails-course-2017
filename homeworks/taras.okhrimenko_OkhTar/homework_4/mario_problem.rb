class MarioProblem
	def main
		puts "It's Mario Piramid." 
		print "What height of pyramids do you want to see? "
		pyramid_level = gets.to_i
		
		minimum_level = 2

		return puts "It does not make sense!!!! Use a value greater than '1'." if
		pyramid_level < minimum_level

		element_1 = ' '
		element_2 = '#'

		(1..pyramid_level).each do |i|
			puts element_1*(pyramid_level-i) + element_2*i + '  ' + element_2*i + element_1*(pyramid_level-i)
		end
	end
end

MarioProblem.new.main
