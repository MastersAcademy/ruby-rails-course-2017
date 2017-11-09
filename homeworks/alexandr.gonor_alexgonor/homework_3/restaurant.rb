class Employer
  attr_accessor :name, :salary, :specialization

  def initialize(name, salary, specialization)
    @name = name
    @salary = salary
    @specialization = specialization
  end

  def get_salary
    puts "My name is #{@name}, and i earn #{@salary} money!"
  end

  def get_specialization
    puts "I am #{@specialization}"
  end
end

class Waiter < Employer

  def take_order(dish)
    puts "What would you like to order #{@dish = dish}?"
  end

  def give_menu
    puts "Please, take menu"
  end

  def give_order_to_cook
    puts "Customer ordered #{@dish}"
  end

  def give_ordered_dish
    puts "Here is your #{@dish}"
  end

  def give_bill(cost)
    puts "Total cost #{cost} money"
    puts "Thank you for coming, hope to see you again!"
  end

  def clean_table
    puts "Cleans the table"
  end
end

class Cook < Employer

  def take_order_from_waiter
    puts "**taking order**"
  end

  def cook_dish(dish)
    puts "**cooking #{dish}**"
  end

  def tasting_dish
    puts "umm yummy!"
  end
end

class Customer
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def choose_table
    puts "#{name}, choose his table"
  end

  def call_waiter
    puts "Сan you come?"
  end

  def read_menu
    puts "**reading menu**"
  end

  def make_order(dish)
    puts "I want this #{dish}"
  end

  def pay_bill
    puts "**give money**"
  end
end

waiter = Waiter.new("Alex", 5000, "waiter") #Создаем нового сотрудника (официант)
puts waiter.get_salary                      #Зарплата
puts waiter.get_specialization              #Специальность
puts waiter.take_order("fish")              #Принимает заказ
puts waiter.give_order_to_cook              #Передает заказ повару
puts waiter.give_ordered_dish               #Отдает приготовленное блюдо посетителю
puts waiter.give_bill(100)                  #Приносит счет
puts waiter.clean_table                     #Чистит стол
puts "----------"
cook = Cook.new("Bob", 7000, "cook") #Создаем нового сотрудника (повар)
puts cook.get_salary                 #Зарплата
puts cook.get_specialization         #Специальность
puts cook.take_order_from_waiter     #Принимает заказ от официанта
puts cook.cook_dish("fish")          #Готовит блюдо
puts cook.tasting_dish               #Дегустирует блюдо
puts "----------"
customer = Customer.new("John") #Новый посетитель
puts customer.choose_table      #Выбирает столик
puts customer.call_waiter       #Зовет официанта
puts customer.read_menu         #Читает меню
puts customer.make_order("fish")#Делает заказ
puts customer.pay_bill          #Оплачивает счет
