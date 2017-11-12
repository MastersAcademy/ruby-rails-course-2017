class Employer
 attributes:
	name
	salary
 methods:
	get_salary()


class visitor
 attributes:
	name
 methods:
 	choose_table()
	call_waiter()
	call_meneger()
 	make_order()
 	eat_dish()
	ask_bill()
 	pay_bill()

class waiter < Employer
 attributes:
	name
	salary

 methods:
 	accept_order()
 	bring_dish()
 	bring_bill()


class maneger < Employer
 attributes:
	name
	salary

 methods:
	talk_with_visitors()

class cook < Employer
 attributes:
	name
	salary

 methods:
 	cooking()

 		
class table
 attributes:
 	number
 methods:
 	occupy()
 	leave()
	order_table()

class order
 attributes:
 	number
	list_of_dishes
 methods:
	record()
 
class dish
 attributes:
 	name
	weight
 	cost
 methods:
 	prepare()
 	eat()

	
class bill
 attributes:
 	ordered_dishes
 	amount
 methods:
 	pay()
 	
