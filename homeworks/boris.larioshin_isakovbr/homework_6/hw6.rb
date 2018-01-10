require 'json'

class AbstractEmployee
    attr_accessor :name, :surname, :age, :salary
  
    def initialize(name, surname, age, salary)
      @name = name
      @surname = surname
      @age = age
      @salary = salary
    end
end

employee = AbstractEmployee.new('Ivan','Ivanov',20,3200)

def employee.object_to_hash
    Hash[*instance_variables.map { |v|
    [v.to_sym, instance_variable_get(v)]
  }.flatten]
end

def employee.hash_to_json(hash)
  hash.to_json
end

def employee.json_to_hash(json)
  JSON.parse(json)
end

hash_start = employee.object_to_hash
puts hash_start
json_middle = employee.hash_to_json(hash_start)
puts json_middle
hash_finish = employee.json_to_hash(json_middle)
puts hash_finish



