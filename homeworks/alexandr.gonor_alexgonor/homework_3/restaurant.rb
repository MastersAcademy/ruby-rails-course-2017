# structure of restaurant
class Employer
  attr_accessor :name, :salary, :specialization

  def initialize(name, salary, specialization)
    @name = name
    @salary = salary
    @specialization = specialization
  end

  def employer_salary
    puts "My name is #{@name}, and i earn #{@salary} money!"
  end

  def employer_specialization
    puts "I am #{@specialization}"
  end
end

# waiter
class Waiter < Employer
  def take_order(dish)
    puts "What would you like to order #{@dish = dish}?"
  end

  def give_menu
    puts 'Please, take menu'
  end

  def give_order_to_cook
    puts "Customer ordered #{@dish}"
  end

  def give_ordered_dish
    puts "Here is your #{@dish}"
  end

  def give_bill(cost)
    puts "Total cost #{cost} money"
    puts 'Thank you for coming, hope to see you again!'
  end

  def clean_table
    puts 'Cleans the table'
  end
end

# cook
class Cook < Employer
  def take_order_from_waiter
    puts '**taking order**'
  end

  def cook_dish(dish)
    puts "**cooking #{dish}**"
  end

  def tasting_dish
    puts 'umm yummy!'
  end
end

# customer
class Customer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def choose_table
    puts "#{name}, choose his table"
  end

  def call_waiter
    puts 'Сan you come?'
  end

  def read_menu
    puts '**reading menu**'
  end

  def make_order(dish)
    puts "I want this #{dish}"
  end

  def pay_bill
    puts '**give money**'
  end
end

waiter = Waiter.new('Alex', 5000, 'waiter')
puts waiter.get_salary
puts waiter.get_specialization
puts waiter.take_order('fish')
puts waiter.give_order_to_cook
puts waiter.give_ordered_dish
puts waiter.give_bill(100)
puts waiter.clean_table
puts '----------'
cook = Cook.new('Bob', 7000, 'cook')
puts cook.get_salary
puts cook.get_specialization
puts cook.take_order_from_waiter
puts cook.cook_dish('fish')
puts cook.tasting_dish
puts '----------'
customer = Customer.new('John')
puts customer.choose_table
puts customer.call_waiter
puts customer.read_menu
puts customer.make_order('fish')
puts customer.pay_bill
