require 'json'

class Hashek
	def initialize(hash)
		hash.each do |key, value|
			define_singleton_method(key) { puts  "#{value}" }
		end
	end
end


hash = { greeting_guests: 'Good day dear visitor! Im Waiter.', 
	give_menu: 'Take menu and call me when you chose some dishes',
	take_order:'Ok. Im comeback whith dishes'}	


puts jsn = JSON.pretty_generate(hash)

puts parsed = JSON.parse(jsn)

