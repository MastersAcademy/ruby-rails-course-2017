class People
  def initialize(name, gender)
    self.name = name
    self.gender = gender
    puts "#{self.class} \"#{name}\" created"
  end

  attr_reader :name, :gender

  def name=(name)
    if name == ''
      raise 'Name can\'t be blank!'
    end
    @name = name
  end

  def gender=(gender)
    unless gender == 'M' || gender == 'F'
      raise 'Gender can be only "M" or "F"'
    end
    @gender = gender
  end
end

class Employee < People
  def initialize(name, gender, salary)
    super(name, gender)
    self.salary = salary
    @free = true
  end

  attr_reader :salary, :free

  def salary=(salary)
    if salary <= 0
      raise 'Salary must be greater than zero!'
    end
    @salary = salary
  end
end

class KitchenEmployee < Employee
end

class Cook < KitchenEmployee
  def add_order(order)
    @order = order
    puts "Cook \"#{name}\" accepted the order"
    @free = false
  end
  def cook_order
    @order.items.each do |order_item|
      if order_item.class == Dish
        puts "Cook \"#{name}\" cooked the \"#{order_item.name}\""
      end
    end
    @free = false
  end
  def get_order
    puts "Cook \"#{name}\" issued the order"
  end
end

class Scullion < KitchenEmployee
  def add_dishes
    puts "Scullion \"#{name}\" accepted the dishes"
    @free = false
  end
  def wash_dishes
    puts "Scullion \"#{name}\" washed the dishes"
    @free = true
  end
end

class HallEmployee < Employee
  def talk_to_guest(guest, message)
    puts "#{self.class} talk to guest \"#{guest.name}\": #{message}"
  end
end

class Barman < HallEmployee
  def add_order(order)
    @order = order
    puts "Barmen \"#{name}\" accepted the order"
    @free = false
  end
  def cook_order
    @order.items.each do |order_item|
      if order_item.class == Drink
        puts "Barmen \"#{name}\" cooked the drink \"#{order_item.name}\""
      end
    end
    @free = false
  end
  def get_order
    puts "Barmen \"#{name}\" issued the order"
  end
end

class Waiter < HallEmployee
  attr_reader :order

  def add_order(guest, order, barman, cook)
    @guest = guest
    @order = order
    @barman = barman
    @cook = cook
    puts "Waiter \"#{name}\" accepted the order"
    @free = false
  end

  def pass_order
    puts "Waiter \"#{name}\" passed order to barman & cook"
    @barman.add_order(order)
    @barman.cook_order
    @cook.add_order(order)
    @cook.cook_order
    @free = false
  end

  def bring_order
    @barman.get_order
    @cook.get_order
    puts "Waiter \"#{name}\" brought order to guest \"#{@guest.name}\""
  end

  def clean_table(table)
    table.clear
    table.release
    @free = false
  end
end

class Guest < People
  attr_reader :companions_number
  attr_writer :miserly
  alias_method :miserly?, :miserly=

  def initialize(name, gender, companions_number, miserly)
    super(name, gender)
    self.companions_number = companions_number
    self.miserly? miserly
  end

  def companions_number=(companions_number)
    if companions_number < 0
      raise 'Number of companions must be zero or greater than zero!'
    end
    @companions_number = companions_number
  end

  def miserly?(miserly)
    if !!miserly != miserly
      raise 'Miserly must be true or false!'
    end
  end

  def visit
    puts "Guest \"#{name}\" visit to the restaurant"
  end

  def eat
    puts "Guest \"#{name}\" has eaten & drank"
  end

  def pay(order)
    order.get_printed_invoice
    order.pay
  end

  def leave_restaurant
    puts "Guest \"#{name}\" leave the restaurant"
  end
end

class Menu
  attr_reader :items

  def initialize
    @items = []
    puts 'Menu created'
  end

  def add_item(item)
    @items.push(item)
    puts "Menu item \"#{item.name}\" added to menu"
  end
end

class MenuItem
  attr_reader :name, :price, :cooking_time

  def initialize(name, price, cooking_time)
    self.name = name
    self.price = price
    self.cooking_time = cooking_time
  end

  def name=(name)
    if name == ''
      raise 'Name can\'t be blank!'
    end
    @name = name
  end

  def price=(price)
    if price <= 0
      raise 'Price must be greater than zero!'
    end
    @price = price
  end

  def cooking_time=(cooking_time)
    if cooking_time <= 0
      raise 'Cooking time must be greater than zero!'
    end
    @cooking_time = cooking_time
  end
end

class Dish < MenuItem
  attr_reader :weight

  def initialize(name, price, cooking_time, weight)
    super name, price, cooking_time
    self.weight = weight
    puts "New dish \"#{name}\" created"
  end

  def weight=(weight)
    if weight <= 0
      raise 'Weight must be greater than zero!'
    end
    @weight = weight
  end
end

class Drink < MenuItem
  attr_reader :volume, :contains_alcohol

  def initialize(name, price, cooking_time, volume, contains_alcohol)
    super name, price, cooking_time
    self.volume = volume
    self.contains_alcohol = contains_alcohol
    puts "New drink \"#{name}\" created"
  end

  def volume=(volume)
    if volume <= 0
      raise 'Volume must be greater than zero!'
    end
    @volume = volume
  end

  def contains_alcohol=(contains_alcohol)
    if !!contains_alcohol != contains_alcohol
      raise 'Contains alcohol must be true or false!'
    end
    @contains_alcohol = contains_alcohol
  end
end

class Order
  attr_reader :items, :total_price, :paid

  def initialize
    @items = []
    @total_price = 0
    @paid = false
    puts 'Order created'
  end

  def add_item(item)
    @items.push(item)
    @total_price += item.price
    puts "Menu item \"#{item.name}\" added to order. Total price - #{@total_price}"
  end

  def get_printed_invoice
    puts "Total price - #{@total_price}"
  end

  def pay
    @paid = true
    puts 'Guest paid order'
  end
end

class Equipment
  attr_reader :name, :price

  def initialize(name, price)
    self.name = name
    self.price = price
  end

  def name=(name)
    if name == ''
      raise 'Name can\'t be blank!'
    end
    @name = name
  end

  def price=(price)
    if price <= 0
      raise 'Price must be greater than zero!'
    end
    @price = price
  end
end

class Table < Equipment
  attr_reader :free, :clean, :seats_number, :busy_by

  def initialize(price, seats_number)
    super 'Table', price
    @free = true
    @clean = true
    self.seats_number = seats_number
    puts 'Table created'
  end

  def seats_number=(seats_number)
    if seats_number <= 0
      raise 'Number of seats must be greater than zero!'
    end
    @seats_number = seats_number
  end

  def busy_by=(guest)
    @busy_by = guest
    @free = false
    @clean = false
    puts "Guest \"#{@busy_by.name}\" took the table"
  end

  def release
    puts "Guest \"#{@busy_by.name}\" fired the table"
    @busy_by = nil
  end

  def clear
    @free = true
    @clean = true
  end
end

menu = Menu.new
menu_item = Dish.new('Steak', 5, 5, 150)
menu.add_item(menu_item)
menu_item = Dish.new('Barbecue', 7, 10, 250)
menu.add_item(menu_item)
menu_item = Dish.new('Salad', 3, 2, 200)
menu.add_item(menu_item)
menu_item = Drink.new('Beer', 3, 0.1, 500, true)
menu.add_item(menu_item)
menu_item = Drink.new('Vodka', 10, 0.1, 300, true)
menu.add_item(menu_item)
menu_item = Drink.new('Juice', 3, 0.1, 250, false)
menu.add_item(menu_item)

table = Table.new(100, 6)

cook_stepan = Cook.new('Stepan', 'M', 1000)
cook_svetlana = Cook.new('Svetlana', 'F', 1200)
scullion_vera = Scullion.new('Vera', 'F', 500)
barman_pavlo = Barman.new('Pavlo', 'M', 900)
waiter_evgen = Waiter.new('Evgen', 'M', 900)
waiter_maria = Waiter.new('Maria', 'F', 900)
guest_petro = Guest.new('Petro Ivanovych', 'M', 2, false)

guest_petro.visit
waiter_evgen.talk_to_guest(guest_petro, 'Hello!')

if guest_petro.companions_number + 1 <= table.seats_number && table.free && table.clean
  table.busy_by =guest_petro
end

order = Order.new
order.add_item(menu.items[1])
order.add_item(menu.items[2])
order.add_item(menu.items[3])
order.add_item(menu.items[4])
order.add_item(menu.items[5])

waiter_evgen.add_order(guest_petro, order, barman_pavlo, cook_stepan)
waiter_evgen.pass_order
waiter_evgen.bring_order

guest_petro.eat
guest_petro.pay(order)
guest_petro.leave_restaurant

waiter_evgen.clean_table(table)

scullion_vera.add_dishes
scullion_vera.wash_dishes


