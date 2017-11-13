#!/usr/bin/env ruby
# coding: utf-8


class Institution
	attr_accessor :type, :name, :menu, :contacts

	def initialize (type = 'restaurant', name = 'someRestaurant', menu = ['dish1', 'dish2', 'dish3', ], contacts = 'some restaurant info' )
		@type = type
		@name = name
		@menu = menu
		@contacts = contacts

		@time = Time.new
	end

	def opened; @time.hour <= 23; end
end

class Employer
	attr_accessor :name, :type

	def initialize (type = 'restaurant', name = 'someRestaurant', menu = ['dish1', 'dish2', 'dish3', ], contacts = 'some restaurant info' )
		@name = name
		@type = type
	end
end

class Waitress < Employer
	attr_accessor :name

	def initialize (name = ['Ann', 'Ramona', 'Kate', 'Diana' ][rand(0..3)] )
		@name = name
	end

	def menu;  puts "Waitress #{@name} bring menu to visitor"; true; end
	def order; puts 'Waitress takes order';                    true; end
	def give;  puts 'Waitress gives dishes';                   true; end
	def bill;  puts 'Waitress brings bill';                    true; end
	def clean; puts 'Waitress cleans table';                   true; end
end

class Visitor
	attr_accessor :name, :table

	def initialize(name, table )
		@name = name
		@table = table
	end

	def goHome; puts 'Visitor returns to home!!!'; true; end

	def choose;    puts "Visitor #{@name.upcase} choose a table ##{table} and sit"; true; end
	def call;      puts "Visitor call a waitress";                                  true; end
	def ask(type); puts "Visitor ask a #{type}";                                    true; end
	def make;      puts "Visitor make the order";                                   true; end
	def awaits;    puts "Visitor awaits";                                           true; end
	def eats;      puts "Visitor eats these dishes";                                true; end
	def pay;       puts "Visitor paid the bill";                                    true; end
	def leave;     puts "Visitor leave the institution";                            true; end
end



# begin our fucking code =)
# define obj
institution = Institution.new
employer = Employer.new
waitress = Waitress.new
visitor = Visitor.new('beginnerCoder', rand(1..10) )

# puts flow
if institution.opened
	visitor.choose && visitor.call && visitor.ask('menu') && visitor.make
	waitress.order
	visitor.awaits
	waitress.give
	visitor.eats && visitor.ask('bill')
	waitress.bill
	visitor.pay && visitor.leave
	waitress.clean
else
	visitor.goHome
end
