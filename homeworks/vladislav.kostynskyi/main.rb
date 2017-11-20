class Employee
  attr_accessor :first_name

  def initialize (first_name)
    @first_name = first_name
  end

end

class Waiter < Employee

  def waiter_comming
    puts 'Customer is comming to the restourant'
  end
  
  def self_presentation
    puts "Waiter: Hello, My name is #{first_name}. Are you ready to take an order?"
  end

  def take_order 
    puts 'Waiter: Please enter the name of the dish you want to order'
  end
  
  def claim_info
    puts 'Waiter: Hey, Your food will be ready in 20 minutes'
  end
  
  def deliver_order
    puts 'Waiter: Here is your order'
  end
  
  def deliver_bill
    puts 'Waiter: Here is your bill'
  end
  
  def thanks
    puts 'Waiter: Thanks for comming and tips!'
  end
  
end

 class Cook < Employee

  def start_coocking
    puts "Cook: #{first_name}, say to the client, his food will be ready in 20 minutes"
  end

  def food_is_ready
    puts "Cook: #{first_name}, Take a food and deliver to the customer"
  end
end

class Customer 

  attr_accessor :waiter_name

  def initialize (waiter_name)
    @waiter_name = waiter_name
  end
  
  def customer_comming
    puts 'Waiter is comming to the customer'
  end

  def new_order
    order = gets.chomp
    puts "Yes, I want to order: #{order}"
  end
  
  def waiting_for_food
    puts 'Ok, we are waiting'
  end
    
  def ask_for_bill
    puts "Customer: #{waiter_name}, Please give my my bill"
  end
  
  def thanks_you
    puts 'Customer: Thanks for the tasty food! I would like to tip you'
  end
  
  def tips
    puts 'Customer: How much do you want?'
    money = gets.chomp
    puts "Customer: Here are your #{money} dollars!"
  end
end  

waiter = Waiter.new('Antony')
waiter.waiter_comming
customer = Customer.new('Antony')
customer.customer_comming
waiter.self_presentation
waiter.take_order
customer.new_order
cook = Cook.new(waiter.first_name)
cook.start_coocking
waiter.claim_info
cook.food_is_ready
waiter.deliver_order
customer.ask_for_bill
waiter.deliver_bill
customer.thanks_you
customer.tips
waiter.thanks