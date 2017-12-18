class Restaurant
  attr_accessor :name

  def initialize(name = "name")
   @name = name
  end

  def opened
    puts "Restaurant #{@name} opened at 11 am."
  end

  def closed
    puts "Restaurant #{@name} closed at 11 pm."
  end

class Employee
  attr_accessor :name

  def initialize(name = "name")
    @name = name
  end
end


class Waiter < Employee

  def menu
    puts "Waiter #{name} give menu to visitor."
  end

  def advice
    puts "#{name} answer the visitor's questions and help to make order."
  end
  
  def order
    puts "#{name} take order."
  end

  def to_kitchen
    puts "#{name} transfer visitor's order to the kitchen."
  end

  def from_kitchen
    puts "#{name} transfer order from the kitchen to visitor's table."
  end

  def bill
    puts "#{name} give  the bill."
  end

  def clean
    puts "#{name} clean table."
  end
end

class Cook < Employee

  def order
    puts "Cook take visitor's order from a waiter."
  end

  def cook
    puts "The cook prepares visitor's order."
  end

  def decor
    puts "The cook put the dish on the plate, decorate it. That's really amazing! The cook give it to waiter."
  end
end

class Visitor
 attr_accessor :name

  def initialize(name = "name")
   @name = name
  end

  def come
    puts "Visitor #{name} came to the restaurant."
  end

  def menu
    puts "#{name} read menu."
  end

  def problem
    puts "#{name} cannot choose dish. #{name} ask the waiter for help."
  end

  def order
    puts "#{name} make order."
  end

  def wait
    puts "#{name} relax in comfortable armchair and wait order."
  end

  def eat
    puts "Mmmmm. No comments. Very tasty! Om-Nom-nom!"
  end

  def bill
    puts "#{name} ask the bill."
  end

  def pay
    puts "#{name} pay for the order and leave tips."
  end

  def go
    puts "#{name} leave restaurant."
  end
end


r = Restaurant.new("u lariski")
w = Waiter.new("Nick")
c = Cook.new
v = Visitor.new("Oleg")

r.opened
v.come
w.menu
v.menu
v.problem
w.advice
v.order
w.order
w.to_kitchen
c.order
c.cook
c.decor
v.wait
w.from_kitchen
v.eat
v.bill
w.bill
v.pay
v.go
w.clean
r.closed

end
