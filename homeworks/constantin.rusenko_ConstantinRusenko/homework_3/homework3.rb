class Employer 
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary         
  end
 
  def salary_day
    puts "#{@name} get #{@salary}"
  end
end

class Visitor 
  attr_accessor :name, :table_number

  def initialize(name)
    @name = name
  end
 
  def choose_table(table)
    puts "Visitor #{@name} choose table #{table.number}"
  end
     
  def call_waiter(waiter)
    puts "Visitor #{@name} call waiter #{waiter.name}"
  end
    
  def call_maneger(maneger)
    puts "Visitor #{@name} call manager #{maneger.name}"
  end
    
  def make_order
    puts "Visitor #{@name} make his order "
  end
     
  def eat_dish(order)
    puts "#{order.ordered_dish} is missing"
  end
     
  def ask_bill(waiter)
    puts "Visitor #{@name} call waiter #{waiter.name} to bring his bill "
  end
    
  def pay_bill(bill)
    puts "Visitor #{@name} pay amount #{bill.amount}"
  end     
end

class Waiter < Employer
  
  def accept_order
    puts "Waiter #{@name} take order"
  end
     
  def bring_dish(order)
    puts "Waiter #{@name} bring #{order.ordered_dish}"
  end
     
  def bring_bill
    puts "Waiter #{@name} bring bill"
  end  
end

class Maneger < Employer
  
  def talk_with_visitors(visitor)
    puts "Maneger #{@name} talk wiht Visitor #{visitor.name}"
  end   
end

class Cook < Employer

  def cooking(order)
    puts "Cook #{@name} make #{order.ordered_dish}"
  end 

end
         
class Table
  attr_accessor :number
 
  def occupy(visitor)
    puts "Visitor #{visitor.name} occupy table number #{number}"
  end

  def leave(visitor)
    puts "Visitor #{visitor.name} leave table number #{number}"
  end

end

class Order
  attr_accessor :ordered_dish, :price
    
  def initialize(ordered_dish, price)
    @ordered_dish = ordered_dish
    @price = price         
  end

end

 

    
class Bill
  attr_accessor :amount
    
  def am(order)
    @amount = order.price 
  end
    
end    


###################################

visitor = Visitor.new('Skrypnikov Vladislav')
table = Table.new
table.number = 2
visitor.choose_table(table)
table.occupy(visitor)
waiter = Waiter.new('Yana', 3500)
visitor.call_waiter(waiter)
visitor.make_order
order = Order.new('Fish', 50)
waiter.accept_order
cook = Cook.new('Elena', 5000)
cook.cooking(order)
waiter.bring_dish(order)
visitor.eat_dish(order)
visitor.ask_bill(waiter)
waiter.bring_bill
bill = Bill.new
bill.am(order)
visitor.pay_bill(bill)
maneger = Maneger.new('Leonid', 8000)
visitor.call_maneger(maneger)
maneger.talk_with_visitors(visitor)
table.leave(visitor)
puts "Today is salary day, take your salary"
waiter.salary_day
cook.salary_day
maneger.salary_day


