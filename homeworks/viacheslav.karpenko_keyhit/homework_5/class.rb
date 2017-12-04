class TestClass
  def initialize(my_hash)
    my_hash.each do |key, value|
      self.class.send(:define_method, key.to_s) do
        puts value
      end
    end
  end
end

my_hash = { a: 'First method!', b: 'Second method!', c: 'Third method!' }
test_class = TestClass.new(my_hash)
test_class.a
test_class.b
test_class.c

class TestClass2
  def method_missing(m)
      puts "Method #{m}_missing!"
  end
end

test_class2 = TestClass2.new
test_class2.x
