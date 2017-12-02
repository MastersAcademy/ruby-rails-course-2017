class Restaurant
attr_accessor :rest_name

  def initialize(rest_name)
    @rest_name = rest_name
  end
end

class Table < Restaurant
  attr_accessor :occupied

  def initialize(occupied = false)
    @occupied = occupied
  end
end

class Order
  attr_accessor :courses, :cost

  def initialize(courses = {}, cost)
    @courses = courses
    @cost = cost
  end
end

class Customer
  attr_accessor :satiety

  def initialize(cust_name, satiety, rest_name)
    @cust_name = cust_name
    @satiety = satiety
    @rest_name = rest_name
  end

  def gets_hungry
    puts "There was an evening. Satiety was #{@satiety}."
  end

  def show_satiety
    puts "Satiety became #{@satiety}."
  end

  def comes_to_restaurant
    puts "You were passing by the '#{@rest_name}' restaurant and desided to come in."
  end

  def seats_at_table
    @table = Table.new(occupied = true)
    print "You sat at the table."
    p @table
  end

  def makes_order(order)
    slow_print do
      "What drink would you have? "
    end
    drink = gets.chomp.upcase

    slow_print do
      "What would you have for main course? "
    end
    main_course = gets.chomp.upcase

    slow_print do
      "And what is for desert? "
    end
    desert = gets.chomp.upcase
    order.courses = {drink: drink, main_course: main_course, desert: desert}
  end

  def has_course(waiter_name, order)
    order.courses.map do |k, v|
      if order.courses.include?(k)
        puts "You have finished #{v}. "
        order.courses.delete(k)
        @satiety += 10
      end
    follow_dinner(waiter_name, order)
    end
  end

  def follow_dinner(waiter_name, order)
    show_satiety
    asks_for_bill?(waiter_name, order)
  end

  def asks_for_bill?(waiter_name, order)
    if order.courses.length == 0
      puts "You called waiter: \"#{waiter_name}, could you bring me a bill?\""
    end
  end

  def pays_bill(order)
    puts "You paid #{order.cost} hrivnas."
  end

  def leaves_table
    @table.occupied = false
    print "You left the table"
    p @table
  end

  def leaves_restaurant
    puts "You went away and wish to come again."
  end
end

class Staff < Restaurant
  attr_accessor :name
end

class FloorStaff < Staff
  def greets_customer(cust_name)
    puts "And said: \"Welcome to '#{@rest_name}', Mr. #{cust_name}!\" "
  end
end

class Porter < FloorStaff
  def opens_door_for_coming(cust_name)
    print "Porter opened the door. "
    greets_customer(cust_name)
  end

  def opens_door_for_leaving(cust_name)
    puts "Porter opened the door and said: \"Good buy, Mr. #{cust_name}!\""
  end
end

class Waiter < FloorStaff
  def initialize(rest_name, name)
      super(rest_name)
      @name = name
  end

  def brings_menu(cust_name)
    print "Waiter brought menu. "
    greets_customer(cust_name)
  end

  def greets_customer(cust_name)
    super
    puts "\"I'm #{@name} and I'm going to serve for you tonight.\""
  end

  def brings_courses(order)
    puts "Waiter brought #{order.courses[:drink]}, #{order.courses[:main_course]} and #{order.courses[:desert]}."
  end

  def brings_bill(order)
    puts "#{@name} brought the bill with sum of #{order.cost}."
  end
end

def slow_print
  yield.each_char { |c| putc c; $stdout.flush; sleep 0.03 }
end

slow_print do
  "Please, enter your name: "
end
cust_name = gets.chomp.capitalize

slow_print do
  "Please, enter your favorite restaurant name: "
end
rest_name = gets.chomp.capitalize
puts"-------------------"

restaurant = Restaurant.new(rest_name)
customer = Customer.new(cust_name, 0, rest_name)

customer.gets_hungry
customer.comes_to_restaurant

porter = Porter.new(rest_name)
porter.opens_door_for_coming(cust_name)
customer.seats_at_table

waiter = Waiter.new(rest_name, "John")
waiter.brings_menu(cust_name)

order = Order.new(100)
puts"-------------------"
customer.makes_order(order)
puts"-------------------"
waiter.brings_courses(order)
customer.has_course(waiter.name, order)
waiter.brings_bill(order)
customer.pays_bill(order)
customer.leaves_table
porter.opens_door_for_leaving(cust_name)
customer.leaves_restaurant
