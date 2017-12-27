require 'json'
require 'pp'

class CoursesPresentError < StandardError
end

class Customer
  attr_reader :name
  attr_accessor :dinner

  def name=(name)
    if name.nil? || name.size.zero?
      raise ArgumentError, "Customer name can't be nil or empty"
    end
    @name = name
  end

  def initialize(name, dinner)
    self.name = name.capitalize
    @dinner = dinner
  end

  def has_dinner
    dinner.each_value do |v|
      if v.nil? || v.size.zero?
        raise CoursesPresentError, "Dinner courses can't be nil or empty"
      end
    end
    puts "Customer asked: I would have"
    @dinner.each {|k, v| puts "#{v} for #{k} "}
  end
end

class Waiter
  def double_check(customer)
    customer.dinner.each do |k, v|
      if v.nil? || v.size.zero?
        puts "Excuse me, Mr. #{customer.name}, what exactly would you like for #{k}?"
        answer = []

        File.open("menu.json", "r") do |file|
            data = JSON.parse(file.read)
            answer = data['desserts'].sample
        end

        if answer.nil? || answer.size.zero?
          raise CoursesPresentError, "There's nil or empty array element in Menu.json file"
        else
          v << answer
        end
      end
    end
    first_and_second_course = customer.dinner.values.first(2).join(", ")
    dessert = customer.dinner.values.last
    puts "Waiter: \"So, Mr. #{customer.name}, your order is: #{first_and_second_course} and #{dessert}\""
  end
end

customer = Customer.new("john", first_course: "soup", second_course: "lasagna", dessert: "" )
waiter = Waiter.new


begin
  customer.has_dinner
rescue CoursesPresentError => e
  puts "Error: #{e.message}"
ensure
  waiter.double_check(customer)
end

begin
  customer.name = nil
rescue  ArgumentError => e
  puts "Error: #{e.message}"
ensure
  customer.name = 'ben'
  pp customer
end

