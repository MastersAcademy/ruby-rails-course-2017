class Main
end

class Object
  def initialize(hash)
    hash.each do |key, value|
      self.class.send(:define_method, key) {puts "#{value}"}
    end
  end
end

hash = { one: 'first', two: 'second' }
puts Object.new(hash).one
puts Main.new(hash).two
