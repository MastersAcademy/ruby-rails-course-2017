# Human
class Human
  attr_reader :name, :gender

  def initialize(name, gender)
    self.name = name
    self.gender = gender.downcase
  end

  def name=(name)
    raise ArgumentError, 'Must be name' unless name
    unless name.chr == name.chr.capitalize
      raise ArgumentError, 'First symbol must be capital'
    end
    @name = name
  end

  def gender=(gender)
    raise ArgumentError, 'Sorry! Everyone has gender' unless gender
    unless gender == 'male' && gender == 'female'
      raise ArgumentError, 'Wrong gender, fix it'
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

hum = Human.new('Sasha', 'asv')

begin
  puts hum.name_h
  puts hum.gender_h
end
