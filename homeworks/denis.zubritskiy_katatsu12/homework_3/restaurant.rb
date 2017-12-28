# Worker
class Worker
  attr_accessor :name, :surname, :salary, :specialty

  def initialize(name, surname, salary, specialty)
    @name = name
    @surname = surname
    @salary = salary
    @specialty = specialty
  end

  def general_information
    puts "#{name} #{surname}, salary: #{salary}, specialty: #{specialty}"
  end
end

# Visitor
class Visitor
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def call_waiter
    puts 'Сould you come up?'
  end

  def ask_for_menu
    puts 'please, give me a menu'
  end

  def make_order(dish)
    puts "I want this - #{@dish = dish}"
  end

  def ask_for_bill
    puts 'Can i have my bill?'
  end

  def give_a_tips
    puts '*give a tips*'
  end
end

# Waiter
class Waiter < Worker
  def take_order
    puts 'What would you order?'
  end

  def send_order_to_chef(dish)
    puts "New order chef #{@dish = dish}"
  end

  def bring_order
    puts "please, your order #{@dish}"
  end

  def bring_bill
    puts 'Your bill, please'
  end

  def clean_tabel
    puts '*cleans the table*'
  end
end

# Cook
class Cook < Worker
  def cook
    puts '*cook*'
  end

  def give_the_dish_to_chef(dish)
    puts "Chef, the #{@dish = dish} is ready"
  end
end

# Chef
class Chef < Worker
  def take_an_order(dish)
    puts "New order - #{@dish = dish} !!"
  end

  def give_the_order_to_cook
    puts "Cooking the #{@dish}"
  end

  def check_the_dish
    puts "*check #{@dish}*"
  end

  def give_the_dish_to_waiter
    puts "The #{@dish} is ready"
  end
end

vis = Visitor.new('Mike')

puts vis.call_waiter
puts vis.ask_for_menu
puts vis.make_order('borsh')
puts vis.ask_for_bill
puts vis.give_a_tips

wai = Waiter.new('Alex', 'Olekseink', 5_000, 'waiter')

puts wai.general_information
puts wai.take_order
puts wai.send_order_to_chef('borsh')
puts wai.bring_order
puts wai.bring_bill
puts wai.clean_tabel

coo = Cook.new('Nick', 'Mishuk', 8_000, 'cook')

puts coo.cook

puts coo.give_the_dish_to_chef('borsh')

che = Chef.new('Mark', 'Alash', 11_000, 'chef')

puts che.take_an_order('borsh')
puts che.give_the_order_to_cook
puts che.check_the_dish
puts che.give_the_dish_to_waiter
