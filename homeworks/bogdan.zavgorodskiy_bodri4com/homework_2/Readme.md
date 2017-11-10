class Restaurant
attributes:
	name
	type_kitchen
	kind_restaurant
methods:
	be_opened()
	be_closed()

class Visitor
attributes:
	name
	table_number
	order
methods:
	choose_table()
	take_menu()
	choose_dish()
	make_order()
	eat_dishes()
	ask_bill()
	pay_bill()
	
class Table
attributes:
	number
	number_of_seats
	cleaned
methods:
	booked_table()
	
class Menu
attributes:
	list_dishes
	dish_name

class Dish
attributes:
	name
	type
	cost
	
class Order
attributes:
	number
	number_of_table
	list_dish
	amount
	
class Worker
attributes:
	name
	specialization
	salary
mathods:
	hired_worker()
	fired_worker()
	
class Waiter
attributes:
	name
methods:
	give_menu()
	take_order()
	transfer_order()
	bring_order()
	bring_bill()
	clean_table()
	
class Kitchener
attributes:
	name
methods:
	pick_order()
	cook_dish()
	give_dishes()

class Bill
attributes:
	amount
	dish_list
	paid


	
	