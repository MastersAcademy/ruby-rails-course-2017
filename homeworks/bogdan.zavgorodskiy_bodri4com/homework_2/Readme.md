##class Waiter
attributes:
	name
methods:
	give_menu
	take_order
	transfer_order_to_kitchen
	bring_order
	bring_check
	pick_payment
	clean_table
	
##class Visitor
attributes:
	name
methods:
	choose_table
	take_menu
	choose_dish
	make_order
	eat_dish
	pay_order

##class Cook
attributes:
	name
	rank_cook
methods:
	pick_order_from_waiter
	cook_dish
	give_dish_to_waiter
	
	
	