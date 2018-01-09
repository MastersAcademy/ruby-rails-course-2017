require 'json'

# customer class with few attributes
class Customer
  attr_reader :info
  def initialize(first_name, last_name, satiety, balance)
    @first_name = first_name
    @last_name = last_name
    @full_name = [@first_name, @last_name].join(' ')
    @satiety = satiety
    @balance = balance
    @info = { first_name: @first_name,
              last_name: @last_name,
              full_name: @full_name,
              satiety: @satiety,
              balance: @balance }
  end
end

customer = Customer.new('Bill', 'Gates', 10, coins: 50, notes: 300)
p customer_ruby_to_json = customer.info.to_json
p JSON.parse(customer_ruby_to_json)
