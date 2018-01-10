# MyValidation
class MyValidation
  require 'json'

  def create_json
    puts 'Please input your full name'
    full_name = gets.split
    my_hash = { 'visitor' => { 'first_name' => full_name[0],
                               'last_name' => full_name[1] } }
    puts 'Please input your order by separating spaces'
    order = gets.split
    order_hash = {}
    order.each_with_index { |dish, i| order_hash.store("dish#{i + 1}", dish) }
    my_hash.store('order', order_hash)
    my_hash.to_json
  end

  def validation(my_json)
    my_hash = JSON.parse(my_json)
    if my_hash['visitor'] == { 'first_name' => 'Cat', 'last_name' => 'Vasya' }
      raise StandardError, 'Acces for cat Vasya is forbidden'
    end
    my_hash['order'].each_value do |value|
      raise ArgumentError, "We don't sell strong alcohol" if value == 'vodka'
    end
  end
end

my_validation = MyValidation.new
my_json = my_validation.create_json
begin
  my_validation.validation(my_json)
rescue ArgumentError
  puts 'Better order wine'
rescue StandardError
  puts "Let's call you Rudolf"
ensure
  puts 'Validation done'
end
