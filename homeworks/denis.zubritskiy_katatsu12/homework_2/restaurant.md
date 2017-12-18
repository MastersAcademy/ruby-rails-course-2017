class Worker
  name
  surname
  salary
end

class Dish
  ingredients
  weight
  price
end

class Table
  size
  number
end

class Visitor
  def choice_of_dishes
  end

  def ask_for_the_bill
  end

  def give_a_tip
  end
end


class Waiter < Worker
  def take_of_the_order
  end

  def send_the_order_to_the_chef
  end

  def treat_the_dishes_to_the_visitor
  end

  def account_filling
  end

  def clean_tabel
  end
end

class Cook < Worker
  def cook a meal
  end

  def give_the_dish_to_the_chef
  end
end

class Chef < Worker
  def take_an_order
  end

  def give_the_order_to_the_cook
  end

  def check_the_dish
  end

  def give_the_dish_to_the_waiter
  end
end
