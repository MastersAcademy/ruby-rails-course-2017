class MarioProblem
	def main
		puts "It's Mario Piramid." 
		print "What height of pyramids do you want to see? "
		pyramid_level = gets.to_i
		
		if pyramid_level < 2
			puts "It does not make sense!!!! Use a value greater than '1'."
			abort
		elsif pyramid_level
		end

		for i in 1..pyramid_level do
			p ' '*(pyramid_level-i) + '#'*i + '  ' + '#'*i
		end
	end
end

rub = MarioProblem.new
rub.main()
