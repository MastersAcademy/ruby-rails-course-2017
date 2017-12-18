class Restaraunt
  attr_accessor :rest_name, :type_cuisine, :contacts

  def opening
  	print "Restaraunt open? (y/n) "
  	open_close = gets.chomp
  	if open_close == "n"
  	  puts "Sorry, but we are Closed."
  	  abort
  	else open_close == "y"
  	  puts "Restaraut is Open. You can visit us."
  	end  	
  end

  def delivery
  	print "We have delivery to your home. Do you need delivery food? (y/n) "
  	delivery_food = gets.chomp
  	if delivery_food == "n"
  	  puts "If you dont need delivery - just visit us!"
  	else delivery_food == "y"
  	  puts "Ok. Choise food and call to us."
  	end 
  end

  def bill
  	@amount = rand(1000)
		puts "Yor bill = #{@amount} UAH"	
  end

  def discount_system
  	discount = @amount - (@amount *0.03)
  	puts "We have Discoun system. Your bill with Discount = #{discount} UAH."
  end
end

class Employee
	attr_accessor :first_name, :last_name, :information

  def salary
  	@salary = @amount * 0.05
  end
end

class Waiter < Employee
	def greeting_guests
		puts "Waiter #{first_name} greet visitor."
	end

	def take_order
		puts "Waiter #{first_name} bring menu and take order."
	end

	def delivery_order
	  puts "Waiter #{first_name} bring order to client."
	end
end

class Cook < Employee
	def take_order
		puts "Cook #{first_name} take order for cooking."
	end

	def cooking_order
		puts "Visitors must wait for dishes. Cook start working."
	end
	
	def dish_to_order
		puts "If client need special dish we have dish from cook."
	end
end

class Cleaning < Employee
	def cleaning_tables
		puts "When visitors left the cleaner #{first_name} cleans off the table."	
	end

	def cleaning_kitchen
		puts "Cleaner #{first_name} must cleans kitchen after closin."
	end

	def dishwashing
		puts "Cleaner #{first_name} must wash the dishes."
	end
end

rest = Restaraunt.new()
rest.rest_name = " Pub-Bar 'Oscar'"
rest.type_cuisine = "Germany cuisin"
rest.contacts = "mail - oscar@info.com | tel - 0472 73 74 79 | web site - oscar.com.ua"
rest.opening
rest.delivery

waiter1 = Waiter.new()
waiter1.first_name = "Max"
waiter1.last_name = "Burlakov"
waiter1.information = "He works with us on of 5 years. He is hardworking and friendly."

cook1 = Cook.new()
cook1.first_name = "Alexandr"
cook1.last_name = "Petrov"
cook1.information = "He works with us on of 2 years. He has a lot of experience and works abroad."

cliner1 = Cleaning.new()
cliner1.first_name = "Julia"
cliner1.last_name = "Melnik"
cliner1.information = "She's a new person. Very fast and careful."

waiter1.greeting_guests
waiter1.take_order
cook1.take_order
cook1.dish_to_order
cook1.cooking_order
waiter1.delivery_order

rest.bill
rest.discount_system

cliner1.cleaning_tables

cliner1.cleaning_kitchen
cliner1.dishwashing
