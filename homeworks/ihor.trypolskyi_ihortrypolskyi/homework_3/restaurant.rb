class Restaurant
  attr_reader :rest_name, :cust_name

  def initialize(rest_name, cust_name)
    self.rest_name = rest_name
    self.cust_name = cust_name
  end

  def rest_name=(rest_name)
    if rest_name == ""
      raise "Name can't be blank"
    end
      @rest_name = rest_name
  end

  def cust_name=(cust_name)
    if cust_name == ""
      raise "Name can't be blank"
    end
    @cust_name = cust_name
  end

end

# class Table < Restaurant
#   def initialize
#     @occupied = false
#   end
# end

class Customer < Restaurant
  attr_accessor :order, :satiety

  def gets_hungry
    @setiety = 0
  end

  def comes_to_restaurant
    puts "You were passing by '#{@rest_name}' restaurant and desided to come in"
  end

  def seats_to_table
    @occupied = true
    puts "The table is occupied by the customer #{@cust_name}"
  end

  def makes_order
    @order = ["drink", "first_course", "second_course", "desert"]
    puts "You made an order #{@order}"
  end

  def has_drink
    if @order.include?("drink")
      @order.delete("dink")
      @setiety =+  10
      puts "You finished a drink"
    end
    check_order
  end

  def check_order
    if @order.length == 0
      puts "All dishes have been eaten"
      pays_bill
    end
  end

  def pays_bill


  end

  def leaves_table
    @occupied = false
    puts "The table is empty again"
  end

  def leaves_restaurant
    puts "You went away and wish to come again"
  end
end

class Staff < Restaurant
  # attr_accessor :name,:tiredness
end

class FloorStaff < Staff

  def greets_customer
    print "And says: Welcome to '#{@rest_name}', Mr. #{@cust_name}. "
  end
end

class Porter < FloorStaff
  def opens_door_for_coming
    puts "Porter opens the door. "
    greets_customer
  end

  def opens_door_for_leaving
    puts "Porter opens the door and says: 'Good buy, Mr. #{@cust_name}!'"
  end
end

class Waiter < FloorStaff
def initialize(rest_name, cust_name, staff_name)
    super(rest_name, cust_name)
    @staff_name = staff_name
end

  def brings_menu
    print "Waiter brings menu. "
    greets_customer
    puts "I'm #{@staff_name} and I'm going to serve for you tonight."
  end

  def brings_drink
    puts "Waiter brings a drink"
  end
end

class KitchenStaff < Staff

end



for i in "Please, enter your name: ".chars.to_a
  print i
  sleep 0.03
end
cust_name = gets.chomp.capitalize

for i in "Please, enter your favorite restaurant name: ".chars.to_a
  print i
  sleep 0.03
end
rest_name = gets.chomp.capitalize



restaurant = Restaurant.new(rest_name, cust_name)
customer = Customer.new(rest_name, cust_name)

customer.comes_to_restaurant

porter = Porter.new(rest_name, cust_name)
porter.opens_door_for_coming

customer.seats_to_table
waiter = Waiter.new(rest_name, cust_name, "John")
waiter.brings_menu
customer.makes_order
waiter.brings_drink
customer.has_drink


puts "_______________"
porter.opens_door_for_leaving
customer.leaves_restaurant
