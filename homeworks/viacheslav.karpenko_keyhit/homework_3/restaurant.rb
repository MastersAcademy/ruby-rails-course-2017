require './modules.rb'

class Human
  attr_accessor :phrase, :move, :order, :money, :mood

  def walk
    puts move
  end

  def speak
    puts phrase
  end

  def make_order
    puts order
  end

  def have_mood
    puts mood
  end
end

class MyFriendAndMe < Human
  attr_accessor :invitation
  def lets_go
    puts invitation
  end
end

class Cook < Human
  include MakeSup
  include MakePotatoes
  include MakeMeat
  include MakeCotlets
  include MakeTea
  include MakeCofee

  attr_accessor :time

  def initialize(sup = '', potatoes = '', meat = '', cotlets = '', tea = '', coffe = '')
    @sup = sup
    @potatoes = potatoes
    @meat = meat
    @cotlets = cotlets
    @tea = tea
    @coffe = coffe
  end

  def cooking_time
    puts "Making dishes takes #{time} minuts and we had got:"
  end
end

class Waitress < Human
  SUP = 14
  POTATOES = 16
  MEAT = 22
  COTLETS = 19
  TEA = 6
  COFFE = 8
  TIP = 10

  attr_accessor :menu, :order

  def receive_order
    puts menu
    puts 'We ordered:'
    order.each do |key, value|
      if value != ''
        puts "#{key} in the amount of #{value}."
      end
    end
  end

  def get_ready_dish
    new_order = Cook.new(order[:sup], order[:potatoes], order[:meat], order[:cotlets], order[:tea], order[:coffe])
    new_order.time = '10'
    new_order.cooking_time
    new_order.make_sup
    new_order.make_potatoes
    new_order.make_meat
    new_order.make_cotlets
    new_order.make_tea
    new_order.make_cofee
  end

  def make_bill
    sup_price = !order[:sup].nil? ? order[:sup] * SUP : 0

    potatoes_price = !order[:potatoes].nil? ? order[:potatoes] * POTATOES : 0

    meat_price = !order[:meat].nil? ? order[:meat] * MEAT : 0

    cotlets_price = !order[:cotlets].nil? ? order[:cotlets] * COTLETS : 0

    tea_price = !order[:tea].nil? ? order[:tea] * TEA : 0

    coffe_price = !order[:coffe].nil? ? order[:coffe] * COFFE : 0

    dish_cost = sup_price + potatoes_price + meat_price + cotlets_price + tea_price + coffe_price
    tip = (dish_cost / 100.to_f) * 10
    bill = dish_cost + tip
    puts "dish cost #{dish_cost} uah."
    puts "tip #{tip} uah."
    puts "Bill #{bill} uah."
  end
end

class Building
  attr_accessor :room, :properties_apertures

  def apertures
    puts properties_apertures
  end

  def room_name
    puts room
  end
end

class Restaurant < Building
  attr_accessor :name, :persons

  def restaurant_name
    puts "It was named #{name}."
  end

  def table
    puts "and took table for #{persons} persons "
  end
end

friends = MyFriendAndMe.new
chatter = 'Once i was ivited to restaurant by my friend.'
friends.invitation = chatter
friends.lets_go
friends.move = 'We had met at street near the restaurant.'
friends.walk

my_donalds = Restaurant.new
my_donalds.name = 'MyDonalds'
my_donalds.restaurant_name
my_donalds.properties_apertures = 'throo glass dors '
my_donalds.room = 'We had entered to dinner hall '
my_donalds.room_name
my_donalds.apertures
my_donalds.persons = 'two'
my_donalds.table
my_donalds.properties_apertures = 'at open window.'
my_donalds.apertures

waitress = Waitress.new
waitress.menu = 'Waitress has given us menu.'
waitress.order = { sup: 2, potatoes: 2, meat: 2, cotlets: nil, tea: 2, coffe: nil }
waitress.receive_order
waitress.get_ready_dish
waitress.make_bill

friends.mood = 'Food and price good ad we had had good time and mood!!!'
friends.have_mood

# My story in results!!!!

# Once i was ivited to restaurant by my friend.
# We had met at street near the restaurant.
# It was named MyDonalds.
# We had entered to dinner hall
# throo glass dors
# and took table for two persons
# at open window.
# Waitress has given us menu.
# We ordered:
# sup in the amount of 2.
# potatoes in the amount of 2.
# meat in the amount of 2.
# cotlets in the amount of 1.
# tea in the amount of 2.
# Making dishes takes 10 minuts and we had got:
# 2 plate(s) of sup.
# 2 plate(s) of potatoes.
# 2 plate(s) of meat.
# 1 plate(s) of cotlets
# 2 cup(s) of tea
# dish cost 135 uah.
# tip 13.5 uah.
# Bill 148.5 uah.
# Food and price good ad we had have good time and mood!!!
