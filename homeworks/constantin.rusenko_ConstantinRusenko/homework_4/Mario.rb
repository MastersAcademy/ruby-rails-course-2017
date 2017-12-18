class Homework4
	def Mario
	 	puts "Input number (number >=2)"
		number = gets.to_i
		if number < 2
			puts "Error"
		else		
			i = 1
			i.upto(number) do |i|
  				puts ' '*(number-i) + '#'*i + '  ' + '#'*i
  			end
  		end
  	end		
end

hmwrk = Homework4.new
hmwrk.Mario