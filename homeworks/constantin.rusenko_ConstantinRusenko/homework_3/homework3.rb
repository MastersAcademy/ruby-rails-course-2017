class Employer
  
 attr_accessor :name, :salary
 
	def get_salary()
	end
end

class Visitor
  
 attr_accessor :name, :table_number
 
 	def choose_table(table)
 	  puts "Visitor #{@name} choose table #{table.number}"
 	end
 	
	def call_waiter
	   puts "Visitor #{@name} call waiter"
	end
	
	def call_maneger
	  puts "Visitor #{@name} call manager"
	end
	
 	def make_order
 	  puts "Visitor #{@name} make his order "
 	end
 	
 	def eat_dish
    puts "dish is missing"
 	end
 	
	def ask_bill(waiter)
	  puts "Visitor #{@name} call waiter to bring his bill "
	end
	
 	def pay_bill(bill)
 	  puts "Visitor #{@name} pay amount #{bill.amount}"
 	end
 	
end


class Waiter < Employer
  
 attr_accessor :name, :salary

 	def accept_order
 	  puts "Waiter take order"
 	end
 	
 	def bring_dish
 	  puts "Waiter bring dish"
 	end
 	
 	def bring_bill
 	  puts "Waiter bring bill"
 	end
 	
end


class Maneger < Employer
  
 attr_accessor :name, :salary

	def talk_with_visitors(visitor)
	  puts "Maneger talk wiht Visitor #{@name}"
	end
	 
end


class Cook < Employer
  
 attr_accessor :name, :salary

 def cooking
  puts "Cook make dish"
 end
   
end


 		
class Table

 attr_accessor :number
 
 def occupy(visitor)
       puts "Visitor #{@name} occupy table number #{number}"
 end

 def leave(visitor)
   puts "Visitor #{@name} leave table number #{number}"
 end

end


class Order
  
 attr_accessor :number, :list_of_dishes


end

 
class Dish
  
 attr_accessor :name, :weight, :cost, :condition
 
 
 	def prepare
 	 puts "Dish is ready to eat"
 	end 
 	
end

	
class Bill
  
 attr_accessor :ordered_dishes, :amount

end	


###################################

visitor = Visitor.new
visitor.name = "Skrypnikov Vladislav"
table = Table.new
table.number = 2
visitor.choose_table(table)
table.occupy(visitor)
waiter = Waiter.new
visitor.call_waiter
visitor.make_order
order = Order.new
order.list_of_dishes
waiter.accept_order
cook = Cook.new
cook.cooking
dish = Dish.new
dish.prepare
waiter.bring_dish
visitor.eat_dish
bill = Bill.new
bill.amount = 15
visitor.ask_bill(waiter)
waiter.bring_bill
visitor.pay_bill(bill)
visitor.call_maneger
maneger = Maneger.new
maneger.talk_with_visitors(visitor)
table.leave(visitor)



