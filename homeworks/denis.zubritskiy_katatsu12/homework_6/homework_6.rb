require "json"

wor = ({ name: "Jon", surname: "X", salary: 50000, specialty: "chef" })

puts "My hash"
puts wor

puts "Json hash"
puts jsonvar = wor.to_json

my_hash = JSON.parse(jsonvar)

puts "Back to hash"
puts my_hash
