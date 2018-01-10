# MyClass
class MyClass
  attr_accessor :my_hash, :my_json

  require 'json'

  def hash_to_json(my_hash)
    my_hash.to_json
  end

  def json_to_hash(my_json)
    JSON.parse(my_json)
  end

  def create_hash
    puts 'Please input your full name'
    full_name = gets.chomp.split
    full_name_h = { 'first_name' => full_name[0], 'last_name' => full_name[1] }
    my_hash = { 'visitor' => full_name_h }
    puts 'Please input your order by separating spaces'
    order = gets.chomp.split
    order_hash = {}
    order.each_with_index { |dish, i| order_hash.store("dish#{i + 1}", dish) }
    my_hash.store('order', order_hash)
    my_hash
  end
end

my_class = MyClass.new
my_hash = my_class.create_hash
puts "It's my hash"
puts my_hash
my_json = my_class.hash_to_json(my_hash)
puts "It's my JSON"
puts my_json
my_hash = my_class.json_to_hash(my_json)
puts "It's my hash again"
puts my_hash
