class Restaurant
	attr_accessor :name, :type_kitchen, :kind_restaurant
	
	def be_opened(restaurant)
		puts "Restaurant #{@name} open."
	end
	
	def be_closed(restaurant)
		puts "Restaurant #{@name} closed."
	end
end

class Visitor
	attr_accessor :name, :table_number, :order
	
	def choose_table(table)
		puts "Visitor #{@name} choose table #{table.number}."
	end	
	
	def take_menu(waiter)
		puts "Visitor #{@name} take menu from waiter #{waiter.name}."
	end
	
	def choose_dish(menu)
		puts "Visitor #{@name} chooses some beutiful dish."
	end
	
	def make_order(order)
		puts "Visitor #{@name} say some dishes to waiter #{waiter.name}, he wrote them in #{order.list_dish}."
	end

	def eat_dishes(order)	
		puts "Visitor #{@name} enjoying your order."
	end 
	
	def ask_bill(waiter)
		puts "Visitor #{@name} asks the bill by waiter #{waiter.name}."
	end
	
	def pay_bill(bill)
		if paid==true then puts "Visitor #{@name} pay #{bill.amount}."
		else puts "Visitor #{@name}  not paying."
	end
end
	
class Table < Restaurant 
	attr_accessor :number, :number_of_seats, :cleaned
	def booked_table(visitor)
		puts "Visitor #{visitor.name} got table #{@number}"
end

class Menu < Restaurant
	attr_accessor :list_dishes, :dish_name
end

class Dish < Menu
	attr_accessor :name, :type, :cost
end

class Order < Table 
	attr_accessor :number, :number_of_table, :list_dish, :amount
end 

class Worker < Restaurant
	attr_accessor :name, :specialization, :salary
	def hired_worker (restaurant)
		puts "Restaurant hired #{@specialization}, call him #{@name}, he will receive #{@salary}."
	end
	
	def fired_worker (restaurant)
		puts "Restaurant fired #{@name} from #{@specialization}. "
	end
	
class Waiter < Worker
	attr_accessor :name
	def give_menu (menu) 
		puts "Waiter #{@name} give menu for visitor #{visitor.name} on table #{table.number}. "
	end

	def take_order (order)
		puts "Waiter #{@name} take order from visitor at the table #{table.number}. "
	end
	
	def transfer_order (kitchener)
		puts "Waiter #{@name} transfer order to #{kitchener.name}."
	end
	
	def bring_order (order)
		puts "Waiter #{@name} bring #{dish.name} to visitor #{visitor.name}."
	end
	
	def bring_bill (order, visitor)
		puts "Waiter bring bill to visitor #{visitor.name}."
	end
	
	def clean_table (table)
		if  cleaned==true then puts "Waiter #{@name} cleaned the table #{table.number}."
		else puts "Waiter #{@name} not cleaned table #{table.number}."
		end
	end
class Kitchener < Worker
	attr_accessor :name
	def pick_order (order)
		puts "Kitchener #{@name} take order from #{waiter.name}."
	end
	
	def cook_dish (order)
		puts "Kitchener #{@name} prepare dish from order #{order.number}."
	end
	
	def give_dishes (order)
		puts "Kitchener #{@name} give ready dishes to waiter #{waiter.name}."
	end
end

class Bill < Order 
	 attr_accessor :amount, :dish_list, :paid
end
	
	
	
restaurant = Restaurant.new
restaurant.name = "Dori"
visitor = Visitor.new
visitor.name = "Vika Ivanivna"
waiter = Waiter.new
waiter.name = "Bohdan Zavg"
table = Table.new
table.number = 15
visitor.choose_table(table)
table.booked_table(visitor)
menu = Menu.new
menu.list_dishes = {"borsch" => 10, "cognac" => 130, "latte" => 25}
waiter.give_menu(menu)
visitor.make_order(menu)
kitchener = Kitchener.new
kitchener.name = "Anton Antonov"
waiter.transfer_order(kitchener)
kitchener.cook_dish(visitor.order)
waiter.give_dishes(visitor.order)
visitor.eat_dishes(visitor.order)
visitor.ask_bill
waiter.bring_bill(visitor.order, visitor)
visitor.pay_bill(bill.amount)
waiter.clean_table = true
		