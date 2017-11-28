require 'json'

user_hash = {'user' =>
  {
  'first_name_and_last_name' => [
  'first_name' => "Alex",
  'last_name' => "Gonor"
  ],
  'full_name' => "Alex.Gonor"
  }
  }

puts json = JSON.pretty_generate(user_hash)
puts "===================================="
puts parsed = JSON.parse(json)
