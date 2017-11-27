class CookEmployee
  def initialize(hash)
    hash.each do |key, value|
      self.class.send :define_method, key do
        puts value
      end
    end
  end
end

cook_hash = {name: 'Evgeniy', surname: 'Petrov', age: 21, salary: 2000}
cook = CookEmployee.new(cook_hash)
cook.name
cook.surname
cook.age
cook.salary