class MyClass

  attr_accessor :my_hash, :my_json

  require 'json'

  def hash_to_json(my_hash)
    my_json = my_hash.to_json
  end

  def json_to_hash(my_json)
    my_hash = JSON.parse(my_json)
  end
  
  def create_hash
    puts 'Please input your full name'
    my_hash = {}
    full_name = gets.chomp.split
    full_name_hash = {}
    full_name_hash.store('first_name', full_name[0])
    full_name_hash.store('last_name', full_name[1])
    
    my_hash.store('visitor', full_name_hash)
    
    puts 'Please input your order by separating spaces'
    order = gets.chomp.split
    order_hash = {}
    order.each_with_index {|dish, i| order_hash.store("dish#{i+1}", dish)}
    
    my_hash.store('order', order_hash)
    
  
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

