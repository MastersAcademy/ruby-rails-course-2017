class Waiter
	attr_accessor :first_name, :last_name

	def initialize (first_name, last_name)
		@first_name = first_name
		@last_name = last_name
	end
end

class Hashek
	def initialize(hash)
		hash.each do |key, value|
			define_singleton_method(key) { puts  "#{value}" }
		end
	end
end


hash = { greeting_guests: 'Good day dear visitor! Im Waiter. My name is:', 
	give_menu: 'Take menu and call me when you chose some dishes',
	take_order:'Ok. Im comeback whith dishes'}	


waiter = Waiter.new("Max", "Burlakov")

hashhh = Hashek.new(hash)
puts pr = "#{hashhh.greeting_guests}" "#{waiter.first_name} " "#{waiter.last_name}"
hashhh.give_menu
print "Do you ready to order? (y/n) "
open_close = gets.chomp
	if open_close == "n"
		puts "Ok, just let me know"
		abort
	elsif open_close == "y"
		hashhh.take_order
	end

