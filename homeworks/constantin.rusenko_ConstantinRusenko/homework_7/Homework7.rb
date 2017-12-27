class Car
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
    raise NotImplementedError, 'It is not a number' unless year.is_a? Fixnum
    if year.nil? || year.to_i.size.zero?
      raise ArgumentError, 'Year field must be number'
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
car1 = Car.new('BMW', 'X6', 2008)
p car1.car_list
car2 = Car.new('Volkswagen', 'Touareg II', 2010)
begin
  car2 = Car.new('Volkswagen', 'Touareg', '2002')
rescue NotImplementedError
  raise StandardError
ensure
  Car.new('Zaz', nil, 1987)
  p 'Incredible'
end
