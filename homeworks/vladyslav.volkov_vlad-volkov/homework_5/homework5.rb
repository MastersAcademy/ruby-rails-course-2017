# Human
class Human
  def initialize(hash_methods)
    hash_methods.each do |key, value|
      define_singleton_method(key) { puts value }
    end
  end
end

human = Human.new(name: 'My name is John',
                  age: 'My age is 18',
                  state: 'I am from USA')
human.name
human.age
human.state
