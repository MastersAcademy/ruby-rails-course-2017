Class MyMetaprogramming
  def initialize(hash)
    hash.each do |key, value|
    	define_singleton_method(key) { puts "#{value}" }
      end
  end
end

hash = {hello: 'Hello my friend)', play: 'Do you wanna play with me?', win:'Winner, winner, chicken dinner'}
newinstance = MyMetaprogramming.new(hash)
puts newinstance.hello
puts newinstance.play
puts newinstance.win