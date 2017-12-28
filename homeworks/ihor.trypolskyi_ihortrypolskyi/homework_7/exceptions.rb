require 'json'
require 'pp'

class CoursesPresentError < StandardError
end

# customer has surname and has dinner
class Customer
  attr_reader :surname, :first_and_second_course, :dessert
  attr_accessor :dinner

  def surname=(surname)
    if surname.nil? || surname.size.zero?
      raise ArgumentError, "Customer surname can't be nil or empty"
    end
    @surname = surname
  end

  def initialize(surname, dinner)
    self.surname = surname.capitalize
    @dinner = dinner
    @first_and_second_course = dinner.values.first(2).join(', ')
    @dessert = dinner.values.last
  end

  def make_order
    dinner.each_value do |v|
      next unless v.nil? || v.size.zero?
      raise CoursesPresentError, "Dinner courses can't be nil or empty"
    end
    puts 'Customer says: I would have'
    @dinner.each { |k, v| puts "#{v} for #{k} " }
  end
end

# waiter checks order courses, take desert from menu.json, tells clarified_order
class Waiter
  def double_check(customer)
    customer.dinner.each do |k, v|
      next unless v.nil? || v.size.zero?
      puts "Waiter: Mr. #{customer.surname}, what would you like for #{k}?"
      parse_file
      return v << @answer unless @answer.nil? || @answer.size.zero?
      raise CoursesPresentError, 'Nil or empty element in Menu.json file'
    end
  end

  def parse_file
    @answer = []
    File.open('menu.json', 'r') do |file|
      data = JSON.parse(file.read)
      @answer = data['desserts'].sample
    end
  end

  def clarified_order(customer)
    puts "Waiter: 'So, Mr. #{customer.surname}, your order \
is: #{customer.first_and_second_course} and #{customer.dessert}'"
  end
end

customer = Customer.new(
  'Jackson',
  first_course: 'soup',
  second_course: 'lasagna',
  dessert: ''
)
waiter = Waiter.new

begin
  customer.make_order
rescue CoursesPresentError => e
  puts "Error: #{e.message}"
ensure
  waiter.double_check(customer)
  waiter.clarified_order(customer)
end

begin
  customer.surname = nil
rescue ArgumentError => e
  puts "Error: #{e.message}"
ensure
  customer.surname = 'slater'
  pp customer
end
