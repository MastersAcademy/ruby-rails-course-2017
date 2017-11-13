class Employee
  attr_accessor :name

  def initialize(name)
   @name=name
  end
end

class Visitor
  attr_accessor :name, :cash

  def initialize(name)
    @name=name
  end

  def choose_the_table
    puts "Visitor #{@name} chooses table #{table.number}"
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

class Hostess<Employee
  attr_accessor :name

  def meets_the_visitor
    puts "Hostess #{@name} meets the visitor #{visitor.name}"
  end

  def propose_the_table
    puts "Hostess #{@name} propose to choose the table"
  end
end

class Waiter<Employee
  attr_accessor :name

  def accepts_the_order
    puts "Waiter #{@name} accepts the order from the visitor at the table #{table.number}"
  end

  def executes_the_order
    puts "Waiter #{@name} goes to executes the order"
  end

  def calculates_a_bill
    puts "Waiter #{@name} calculates total bill for the table #{table.numbe}"
  end

  def brings_a_bill
    puts "Waiter #{@name} brings a bill"
  end

  def takes_the_payment
    puts "Waiter #{@name} takes the payment from the visitor #{visitor.name}"
  end

  def washes_the_table
    puts "Waiter #{@name} washes the table #{table.numbe}"
  end

class Table
  attr_accessor :number, :number_of_seats

  def offered_by_the_hostess(hostess)
    puts "Hostess #{hostess.name} proposed the  table #{table.numbe}"
  end

  def booked_by_a_visitor(visitor)
    puts "Visitor #{visitor.name} occupy the table #{table.numbe}"
  end

  def washed_by_a_waiter(waiter)
    puts "Waiter #{waiter.name} wash the table #{table.numbe}"
  end

class Order
  attr_accessor :name_of_the_dish, :weight_of_the_dish, :price_of_the_dish
end

class Bill
  attr_accessor :name_of_the_dish, :price_of_the_dish, :total_to_be_paid
end



  visitor = Visitor.new
  visitor.name = "Ruslan"
  hostess = Hostess.new
  hostess.name = "Olly"
  waiter = Waiter.new
  waiter.name = "Karina"
  table = Table.new
  table.number = 7
  bill = Bill.new
  bill.total = 82
  hostess.meets_the_visitor
  hostess.propose_the_table(table)
  visitor.choose_the_table(table)
  visitor.make_order
  waiter.accepts_the_order
  waiter.executes_the_order
  visitor.ask_a_bill
  waiter.calculates_a_bill(bill)
  waiter.brings_a_bill(bill)
  visitor.pay_a_bill(bill)
  waiter.takes_the_payment
  waiter.washes_the_table(table)

end
end