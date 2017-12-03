require 'json'

class Hostess
  attr_accessor :name, :age

  def initialize(data)
    data.each do |key, value|
            define_singleton_method(key) {  puts(value); value }
          end
  end
end

hash = { name: 'Olly', age: '23' }
data = hash.merge({:total_data => hash.values.join(" ")})
hostess = Hostess.new(data)

puts hostess_hash = {'hostess' => {'name_and_age' => ['name' => "#{hostess.name}",
'age' => "#{hostess.age}"], 'total_data' => "#{hostess.total_data}"}}

puts hash_to_json = JSON.to_json(hostess_hash)
puts json_to_hash = JSON.parse(hash_to_json)
