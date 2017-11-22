class MetaProgramming
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { puts "#{value}" }
    end
  end
end

hash = { one: 'first', two: 'second', three: 'third' }
instance = MetaProgramming.new(hash)
puts instance.one
puts instance.two
puts instance.three

class Employer
  attr_accessor :specialization

  def initialize(specialization, hash1)
    @specialization = specialization
    hash1.each do |key, value|
      define_singleton_method(key) { puts "#{value}" }
    end
  end
end

hash1 = { salary: 1000, name: 'Alex' }
waiter = Employer.new('waiter', hash1)
puts waiter.salary
puts waiter.name
