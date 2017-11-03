class visitor
attributes:
	name
	table_number
methods:
	choose_table()
	sit_at_table()
	make_order()
	eat_dish()
	order_bill()
	pay_bill()
	release_table()
		
class table
attributes:
	number
	number_of_seats
methods:
	occupy()
	release()
	
class bill
attributes:
	ordered_dishes
	amount
methods:
	pay()
	calculate_amount()
	
class waiter
attributes:
	name
methods:
	accept_order()
	bring_dish()
	bring_bill()
	accept_payment()
	
class dish
attributes:
	name
	cost
methods:
	prepare()
	eat()

class cook
attributes:
	name
methods:
	receive_order()
	prepare_dish()

class order
attributes:
	number
	list_of_dishes
methods:
	execute()