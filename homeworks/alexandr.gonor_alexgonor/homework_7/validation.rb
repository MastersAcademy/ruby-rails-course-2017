require 'json'
require 'yaml'

class User
  def initialize(params)
    params.each do |key, value|
      define_singleton_method(key) {  puts(value); value }
    end
  end
end

puts "Tell me your first name"
name = gets.chomp
puts "And last name"
surname = gets.chomp

begin
  if name.size.zero?
    raise StandardError
  end
  rescue
      name = 'John'
      puts 'We give you name, one way or another'
  ensure
    name = name.downcase.capitalize
end

begin
  if surname.size.zero?
    raise StandardError
  end
  rescue
      surname = 'Doe'
      puts 'We give you surname, one way or another'
  ensure
    surname = surname.downcase.capitalize
end

hash = { first_name: name, last_name: surname }
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
puts "===================================="
File.open("user.yml", "w") do |file|
        file.write(parsed.to_yaml)
end
puts yaml = parsed.to_yaml
puts "===================================="
puts YAML.load(File.read("user.yml"))
puts "===================================="
