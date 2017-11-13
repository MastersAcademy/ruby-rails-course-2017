class Restaurant
        attr_accessor :name, :number_of_tables
        
        def come_to_restaurant(visitor)
                puts "Visitor #{visitor.name} come to restaurant #{@name}"
        end
        
        def leave_restaurant(visitor)
                puts "Visitor #{visitor.name} leave restaurant #{@name}"
        end
end

class Visitor
        attr_accessor :name, :table_number, :order

        
        def choose_table(table)
                puts "Visitor #{@name} choose table #{table.number}"
        end
        
        def choose_dishes(menu)
                puts "Visitor #{@name} choose dishes #{menu.selected_dishes}"
        end  
        
        def make_order(menu)
                
                menu.selected_dishes = menu.selected_dishes.gsub(',', '')
                menu.selected_dishes = menu.selected_dishes.split(' ')
                dishes_list_size = menu.selected_dishes.size
                @order = Order.new
                @order.dishes_list = []
                for i in 0..dishes_list_size-1
                        dish = Dish.new
                        dish.name = menu.selected_dishes[i]
                        dish.cost = menu.list_of_dishes[dish.name]
                        @order.dishes_list.push(dish)
                end
                menu.selected_dishes = menu.selected_dishes.join(', ')
                puts "Visitor #{@name} choose dishes and make order #{menu.selected_dishes}"
        end        
        
        def eat_dishes(order)
                order.dishes_list.each do |dish|
                        if dish.name != "coffee" && dish.name !="tea" then puts "Visitor #{@name} eat #{dish.name}"
                        else puts "Visitor #{@name} drink #{dish.name}"
                        end
                end
        end

        def ask_bill
                puts "Visitor #{@name} ask bill"
        
        end
        
        def pay_bill(bill)
                paid = true
                puts "Visitor #{@name} pay bill"
        
        end
        
        def leave_tip(waiter, amount)
                tip = Tip.new
                tip.amount = amount
                puts "Visitor #{@name} leave tip #{amount} UAH for waiter #{waiter.name}"
                
        
        end
end


class Employee < Restaurant
        attr_accessor :name, :position

end

class Waiter < Employee
        attr_accessor :name, :order, :cook, :bill

        def greet_visitor(visitor)
                puts "Waiter #{@name} greet visitor #{visitor.name} and propose to choose table"
        end

        def bring_menu(menu)
                puts "Waiter #{@name} bring #{menu.name} and propose to choose dishes"
        end
        
        def transfer_order(cook)
                puts "Waiter #{@name} transfer order to cook #{cook.name}"
        end
        
        def bring_order(order)
                order.dishes_list.each do |dish|
                        puts "Waiter #{@name} bring #{dish.name}"
                end
        end
        
        def calculate_amount(order, table)
                amount = 0
                order.dishes_list.each do |dish|
                        amount += dish.cost
                end
                puts "Waiter calculate amount #{amount} UAH for table #{table.number}"
                order.amount = amount
        end
        
        def bring_bill(order, visitor)
                @bill = Bill.new
                @bill.dishes_list = order.dishes_list
                @bill.amount = order.amount
                puts "Waiter bring bill to visitor #{visitor.name}"
        end
        
        def clean_table(table)
                table.cleaned = true
                puts "Waiter #{@name} clean table number #{table.number}"
        end        
end

class Table < Restaurant
        attr_accessor :number, :cleaned
        
        def occupy_table(visitor)
                puts "Visitor #{visitor.name} occupy table #{@number}"
        end
        
        def release_table(visitor)
                puts "Visitor #{visitor.name} release table #{@number}"
        end
        
end

class Menu < Restaurant
        attr_accessor :list_of_dishes, :name, :selected_dishes
end

class Dish < Menu
        attr_accessor :name, :cost, :prepared
end

class Order < Visitor
        attr_accessor :dishes_list, :amount
end

class Cook < Employee
        attr_accessor :order
        
        def prepare_order(order)
                order.dishes_list.each do |dish|
                        puts "Cook #{@name} prepare #{dish.name}"
                        dish.prepared = true
                end
        end
end

class Bill < Waiter
        attr_accessor :amount, :dishes_list, :paid
end

class Tip < Visitor
        attr_accessor :amount, :waiter
end

######################Testing#############################

restaurant = Restaurant.new
restaurant.name = "Cherkassy"
visitor = Visitor.new
visitor.name = "Ivan Petrov"
restaurant.come_to_restaurant(visitor)
waiter = Waiter.new
waiter.name = "Petr Ivanov"
waiter.greet_visitor(visitor)
table = Table.new
table.number = 10
visitor.choose_table(table)
table.occupy_table(visitor)
menu = Menu.new
menu.list_of_dishes = {"soup" => 20, "salad" => 30, "tea" => 10, "coffee" => 15}
menu.name = "regular menu"
waiter.bring_menu(menu)
menu.selected_dishes = "soup, " + "salad, " + "coffee"
visitor.make_order(menu)
cook = Cook.new
cook.name = "Semen Gromov"
waiter.transfer_order(cook)
cook.prepare_order(visitor.order)
waiter.bring_order(visitor.order)
visitor.eat_dishes(visitor.order)
visitor.ask_bill
waiter.calculate_amount(visitor.order, table)
waiter.bring_bill(visitor.order, visitor)
visitor.pay_bill(waiter.bill)
visitor.leave_tip(waiter, 10)
table.release_table(visitor)
restaurant.leave_restaurant(visitor)
waiter.clean_table(table)
