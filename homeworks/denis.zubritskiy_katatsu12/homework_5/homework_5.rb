class Worker

  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { puts "#{value}" }
    end
  end
end

wor = Worker.new({ name: "Jon", surname: "X", salary: 50000, specialty: "chef" })

puts wor.name
puts wor.surname
puts wor.salary
puts wor.specialty
