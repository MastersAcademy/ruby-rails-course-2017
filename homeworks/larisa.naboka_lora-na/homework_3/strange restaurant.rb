class Restaurant
  attr_accessor :name

  def initialize(name = "name")
   @name = name
  end

  def r_opened
  puts "Restaurant #{@name} opened at 11 am."
  end

  def r_closed
  puts "Restaurant #{@name} closed at 11 pm."
  end

class Employee
  attr_accessor :name

  def initialize(name = "name")
    @name = name
  end
end


class Waiter < Employee

  def w_menu
  puts "Waiter #{@name} give menu to visitor."
  end

  def w_advice
  puts "#{@name} answer the visitor's questions and help to make order."
  
  def w_order
  puts "#{@name} take order."
  end

  def w_to_kitchen
  puts "#{@name} transfer visitor's order to the kitchen."
  end

  def w_from_kitchen
  puts "#{@name} transfer order from the kitchen to visitor's table."
  end

  def w_bill
  puts "#{@name} give  the bill."
  end

  def w_clean
  puts "#{@name} clean table."
  end
end

class Cook < Employee

  def c_order
  puts "Cook take visitor's order from a waiter."
  end

  def c_cook
  puts "The cook prepares visitor's order."
  end

  def c_decor
  puts "The cook put the dish on the plate, decorate it. That's really amazing! The cook give it to waiter."
  end
end

class Visitor
 attr_accessor :name

  def initialize(name = "name")
   @name = name
  end

  def v_come
  puts "Visitor #{@name} came to the restaurant."
  end

  def v_menu
  puts "#{@name} read menu."
  end

  def v_problem
  puts "#{@name} cannot choose dish. #{@name} ask the waiter for help."
  end

  def v_order
  puts "#{@name} make order."
  end

  def v_wait
  puts "#{@name} relax in comfortable armchair and wait order."
  end

  def v_eat
  puts "Mmmmm. No comments. Very tasty! Om-Nom-nom!"
  end

  def v_bill
  puts "#{@name} ask the bill."
  end

  def v_pay
  puts "#{@name} pay for the order and leave tips."
  end

  def v_go
  puts "#{@name} leave restaurant."
  end
end


r = Restaurant.new("u lariski")
w = Waiter.new("Nick")
c = Cook.new
v = Visitor.new("Oleg")

r.r_opened
v.v_come
w.w_menu
v.v_menu
v.v_problem
w.w_advice
v.v_order
w.w_order
w.w_to_kitchen
c.c_order
c.c_cook
c.c_decor
v.v_wait
w.w_from_kitchen
v.v_eat
v.v_bill
w.w_bill
v.v_pay
v.v_go
w.w_clean
r.r_closed

end
end
