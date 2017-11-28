require 'json'

class User

  def initialize(params)
    params.each do |key, value|
      define_singleton_method(key) {  puts(value); value }
    end
  end
end

hash = { first_name: 'Alex', last_name: 'Gonor' }
params = hash.merge({:full_name => hash.values.join(" ")})
user = User.new(params)

puts user_hash = {'user' =>
  {
  'first_name_and_last_name' => [
  'first_name' => "#{user.first_name}",
  'last_name' => "#{user.last_name}"
  ],
  'full_name' => "#{user.full_name}"
  }
  }
  
puts json = JSON.pretty_generate(user_hash)
puts "===================================="
puts parsed = JSON.parse(json)
