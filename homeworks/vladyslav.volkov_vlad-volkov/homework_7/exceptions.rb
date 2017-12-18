class MyValidation
  attr_reader :my_json
  
  require 'json'
  
  def create_json
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
    my_json = my_hash.to_json

  
  end
  
  def validation(my_json)
  
    my_hash = JSON.parse(my_json)
    
    
    if my_hash["visitor"]["first_name"] == 'Cat' && my_hash["visitor"]["last_name"] == 'Vasya'
      raise StandardError.new('Acces for cat Vasya is forbidden')
    end
    
    
    my_hash["order"].each do |key, value|
      if value == 'vodka'
        raise ArgumentError.new("We don't sell strong alcohol")
      end
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
