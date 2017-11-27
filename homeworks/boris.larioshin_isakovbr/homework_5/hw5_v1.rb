class WaiterEmployee
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method (key) {puts "#{value}"}
    end
  end
end

waiter_hash = {name: 'Ilya', surname: 'Ilf', age: 20, salary: 1000}
waiter = WaiterEmployee.new(waiter_hash)
waiter.name
waiter.surname
waiter.age
waiter.salary