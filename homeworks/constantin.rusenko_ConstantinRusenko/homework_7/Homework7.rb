class car_list

	attr_reader :car_mark, :car_model, :year

	def car_mark=(car_mark)
    if car_mark.nil? || car_mark.size.zero?
      raise ArgumentError.new('Car must have a mark.')
    end
    @car_mark = car_mark
  end


	def car_model=(car_model)
    if car_model.nil? || car_model.size.zero?
      raise ArgumentError.new('Car must have a model.')
    end
    @car_model = car_model
  end


	def year=(year)
		if year.nil? || year.syze.zero? || year.integer?
			raise ArgumentError.new ('Year field must be number')
		end
		@year = year
	end


	def car_list
		"#{@car_mark} #{@car_model} #{@year}"
	end


	def initialize(car_mark, car_model, year)
		self.car_mark = car_mark
		self.car_model = car_model
		self.year = year
	end
end

puts "Input car mark, car model and year of issue"
car1 = Car_list.new ('BMW', 'X6', '2008')
puts car1.car_list
car2 = Car_list.new ('Volkswagen', 'Touareg II', '2010')
begin
  car1.year = '20!8'
rescue ScriptError
ensure
  Car_list.new('Zaz', nil, 1987)
  p 'Incredible'
end
