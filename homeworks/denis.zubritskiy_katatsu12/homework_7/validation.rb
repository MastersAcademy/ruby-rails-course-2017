class Human
  attr_reader :name, :gender

  def initialize(name, gender)
    self.name = name
    self.gender = gender.downcase
  end

  def name=(name)
    if name.nil?
      raise ArgumentError.new('Must be name')
    end
    unless name.chr == name.chr.capitalize
      raise ArgumentError.new('First symbol must be capital')
    end
    @name = name
  end

  def gender=(gender)
    if gender.nil?
       raise ArgumentError.new('Sorry! Everyone has gender')
    end
    unless gender == 'male' or gender == 'female'
       raise ArgumentError.new('Wrong gender')
    end
    @gender = gender
  end

  def name_h
    puts "Hello. My name is #{@name}!"
  end

  def gender_h
    puts "I'm a #{@gender}"
  end
end

hum = Human.new("Sasha", "s")

begin
  puts hum.name_h
  puts hum.gender_h
rescue ArgumentError
end
