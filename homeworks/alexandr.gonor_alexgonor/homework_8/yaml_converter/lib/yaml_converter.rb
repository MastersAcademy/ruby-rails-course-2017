require "yaml_converter/version"
require 'my_gem/railtie' if defined?(Rails)

module YamlConverter
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
  if name.empty?
    raise StandardError.new("Name can't be nil")
  end
  rescue
    name = 'John'
    puts 'We give you name, one way or another'
  ensure
    name = name.downcase.capitalize
end

begin
  if surname.empty?
    raise StandardError.new("Surname can't be nil")
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

user_hash = {'user' =>
  {
  'first_name_and_last_name' => [
  'first_name' => "#{user.first_name}",
  'last_name' => "#{user.last_name}"
  ],
  'full_name' => "#{user.full_name}"
  }
  }

File.open("user.yml", "w") do |file|
        file.write(user_hash.to_yaml)
end
