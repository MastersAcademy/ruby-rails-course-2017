class Restaurant
attributes:
        name
        number_of_tables
methods:
        come_to_restaurant()
        leave_restaurant()

class Visitor
attributes:
        name
        table_number
        order
methods:
        choose_table()
        choose_dishes()
        make_order()
        eat_dish()
        ask_bill()
        pay_bill()
        leave_tip()

class Table < Restaurant
attributes:
        number
        number_of_seats
        cleaned
methods:
        occupy_table()
        release_table()


class Employee < Restaurant
attributes:
        name
methods:
        recruit()
        dismiss()

class Waiter < Employee
attributes:
        name
methods:
        greet_visitor()
        bring_menu()
        transfer_order()
        bring_order()
        calculate_amount()
        bring_bill()
        clean_table()

class Menu < Restaurant
attributes:
        list_of_dishes
        selected_dishes
methods:
       

class Dish < Menu
attributes:
        name
        cost
methods:


class Cook < Employee
attributes:
        name
methods:
        receive_order()
        prepare_order()

class Order
attributes:
        number
        dishes_list
        amount
methods:

class Bill < Waiter
attributes:
        dishes_list
        amount
        paid
methods:

###############user story#####################################

Visitor Ivan Petrov go to restaurant "Cherkassy".
Waiter Petr Ivanov greete visitor and propose to choose table.
Visitor Ivan Petrov choose table number 10. and occupy it.
Waiter Petr Ivanov bring menu and propose to choose dishes.
Visitor Ivan Petrov choose "Salad" and "Soup" and make order.
Waiter Petr Ivanov transfer order to cook Semen Gromov.
Cook Semen Gromov prepare dishes "Salad" and "Soup".
Waiter Petr Ivanov transfer dishes to visitor Ivan Petrov.
Visitor Ivan Petrov eat dishes.
Visitor Ivan Petrov ask bill.
Waiter Petr Ivanov calculate amount 100 UAH and bring bill to visitor.
Visitor Ivan Petrov pay bill.
Visitor Ivan Petrov thank and leave a tip 10 UAH for the waiter.
Visitor Ivan Petrov release table number 10.
Visitor Ivan Petrov leave restaurant "Cherkassy".
Waiter Petr Ivanov clean up table number 10.





