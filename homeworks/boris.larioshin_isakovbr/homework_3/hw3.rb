require 'json'

# Basic class for all employees
class AbstractEmployee
  attr_accessor :name, :surname, :age, :salary

  def initialize(name, surname, age, salary)
    @name = name
    @surname = surname
    @age = age
    @salary = salary
  end

  # Work with the order, there is every employee,
  # but it is performed in different ways
  def work_with_order(order)
    puts "Your #{order}"
  end

  # Getting a payroll, every employee has
  def pay_salary
    puts "My salary for this month #{salary}"
  end
end

# The class describes the duties of the waiter
class Waiter < AbstractEmployee
  # Greetings from the visitor
  def hello
    puts "Hello. My name is #{name}. What do you want?"
  end

  # Working with the order
  def work_with_order(order)
    puts "The number of your order is #{order.number}. Please wait."
    puts 'It\'s correct?'
    puts order.about_order
  end

  # Buyer's order amount
  def bill(order)
    puts "For your order number #{order.number}. From you to pay #{order.cost}$."
  end

  def order_to_kitchen(cook, number)
    puts "#{cook} prepare the order number #{number}!"
  end

  def take_dish
    puts 'Your order. Bon Appetit!'
  end
end

# The class describes the duties of the cook
class Cook < AbstractEmployee
  # Working with the order
  def work_with_order(order)
    puts "For this dish, I need the following products #{order.dish.ingredients} After 30 minutes, the order will be ready."
  end
end

# The class describes the visitor's capabilities
class Customer
  # Customer list menu
  def list_menu(menu)
    menu.each.with_index { |val, index| puts "It's number: #{index + 1} #{val.about_dish}" }
  end
  # Select dish and return his number
  def select_dish(menu, item)
    puts 'Hm....  Interesting.'
    puts "Waiter! Bring me please #{menu[item].title}"
    return item
  end
end

# The class describes the order
class Order
  attr_accessor :number, :dish, :amount, :cost

  def initialize(number, dish, amount)
    @number = number
    @dish = dish
    @amount = amount
    @cost = dish.prise * amount
  end

  def about_order
    puts '===================================================================='
    puts "Number of your order is #{number}"
    puts "You have ordered a #{dish.title} in the amount of #{amount} servings"
    puts "Total order value #{cost} dollars"
    puts '===================================================================='
  end
end
# The class describes the dish
class Dish
  attr_accessor :title, :ingredients, :portion_output, :prise

  def initialize(title, ingredients, portion_output, prise)
    @title = title
    @ingredients = ingredients
    @portion_output = portion_output
    @prise = prise
  end

  def about_dish
    puts '===================================================================='
    puts "The dish #{title}"
    puts "consists of: #{ingredients}"
    puts "Portion of #{portion_output} grams."
    puts "You will pay for this dish #{prise} dollars"
    puts '===================================================================='
  end
end

# Cafe
# Create a menu for a cafe
file = File.read('dish.json')
data = JSON.parse(file)
menu = data['Dish'].map { |rd| Dish.new(rd['title'], rd['ingredients'], rd['portion_output'], rd['prise']) }
# The waiter began work
waiter = Waiter.new('Sam', 'Winchester', 30, 5000)
# First visitor
customer = Customer.new
waiter.hello
customer.list_menu(menu)
selected_item = customer.select_dish(menu, rand(0..menu.size-1))
order = Order.new(1,menu[selected_item], 1)
waiter.work_with_order(order)
# The cook began work
cook = Cook.new('Din', 'Winchester', 35, 7000)
waiter.order_to_kitchen(cook.name, order.number)
cook.work_with_order(order)
waiter.take_dish
puts 'Some time has passed...'
waiter.bill(order)
