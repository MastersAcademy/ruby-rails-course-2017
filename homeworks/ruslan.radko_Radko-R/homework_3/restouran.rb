class Employee
  attr_accessor :name

  def initialize(name)
   @name = name
  end
end

class Visitor
  attr_accessor :name, :cash

  def initialize(name)
    @name = name
  end

  def choose_the_table(table_number)
    puts "Visitor #{name} chooses table #{table_number}"
  end

  def make_order
       puts "Visitor #{@name} make an order"
  end

  def ask_a_bill
    puts "Visitor #{@name} call waiter to bring a bill"
  end

  def pay_a_bill
    puts "Visitor #{@name} pay a bill"
  end
end

class Hostess < Employee

  def meets_the_visitor(visitor_name)
    puts "Hostess #{name} meets the visitor #{visitor_name}"
  end

  def propose_the_table
    puts "Hostess #{name} propose to choose the table"
  end
end

class Waiter < Employee

  def accepts_the_order(table_number)
    puts "Waiter #{name} accepts the order from the visitor at the table #{table_number}"
  end

  def executes_the_order
    puts "Waiter #{name} goes to executes the order"
  end

  def calculates_a_bill(table_number)
    puts "Waiter #{name} calculates total bill for the table #{table_number}"
  end

  def brings_a_bill
    puts "Waiter #{name} brings a bill"
  end

  def takes_the_payment(visitor_name)
    puts "Waiter #{name} takes the payment from the visitor #{visitor_name}"
  end

  def washes_the_table(table_number)
    puts "Waiter #{name} washes the table #{table_number}"
  end
end

class Table
  attr_accessor :number, :number_of_seats

  def initialize(number, number_of_seats)
    @number = number
    @number_of_seats = number_of_seats
  end

  def offered_by_the_hostess(hostess)
    puts "Hostess #{hostess.name} proposed the  table #{table.number}"
  end

  def booked_by_a_visitor(visitor)
    puts "Visitor #{visitor.name} occupy the table #{table.number}"
  end

  def washed_by_a_waiter(waiter)
    puts "Waiter #{waiter.name} wash the table #{table.number}"
  end
end

class Order
  attr_accessor :name_of_the_dish, :weight_of_the_dish, :price_of_the_dish
end

class Bill
  attr_accessor :name_of_the_dish, :price_of_the_dish, :total_to_be_paid
end

visitor = Visitor.new('Ruslan')
hostess = Hostess.new('Olly')
waiter = Waiter.new('Karina')
table = Table.new(7,3)
hostess.meets_the_visitor(visitor.name)
hostess.propose_the_table
visitor.choose_the_table(table.number)
visitor.make_order
waiter.accepts_the_order(table.number)
waiter.executes_the_order
visitor.ask_a_bill
waiter.calculates_a_bill(table.number)
waiter.brings_a_bill
visitor.pay_a_bill
waiter.takes_the_payment(visitor.name)
waiter.washes_the_table(table.number)
