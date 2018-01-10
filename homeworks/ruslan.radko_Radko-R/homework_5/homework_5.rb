class Hostess
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { puts "#{value}" }
    end
  end
end

hash = {hello:'Hello, my name is Olya.', meet:'Glad to see you at our restaurant.', propose:'Do you want a table near the window?'}
instanse = Hostess.new(hash)
puts instanse.hello
puts instanse.meet
puts instanse.propose
