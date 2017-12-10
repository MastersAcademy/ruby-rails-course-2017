class Cat
  attr_reader :name, :name_of_the_owner

  def name=(name)
    if name.nil?
      raise ArgumentError.new('Where is your name??')
    end
    if name == "Zhuk"
      raise ArgumentError.new('Is this name not for dogs??')
    end
    @name = name
  end

  def name_of_the_owner=(name_of_the_owner)
    if name_of_the_owner.nil?
       raise ArgumentError.new('Do not you have an owner??')
    end
    if name_of_the_owner == "Lora"
       raise ArgumentError.new('Lora is absent today! ayayay')
    end
    @name_of_the_owner = name_of_the_owner
  end

  def name_n
    puts "Meow meow. I'm #{@name}!"
  end

  def my_owner
    puts "My owner is #{@name_of_the_owner}:)"
  end

  def initialize(name, name_of_the_owner)
    self.name = name
    self.name_of_the_owner = name_of_the_owner
  end
end

cat = Cat.new("Lolita", "Sofia")

begin
  puts cat.name_n 
  puts cat.my_owner
rescue ArgumentError
end






