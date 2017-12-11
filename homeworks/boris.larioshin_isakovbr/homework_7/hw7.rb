# Create exception for Dish
class DishException < StandardError
  def message
    " Check the data file. The data is not complete."
  end
end

# The class describes the dish
class Dish
  attr_accessor :title, :ingredients, :portion_output, :prise

  def initialize(title, ingredients, portion_output, prise)
    @title          = title
    @ingredients    = ingredients
    @portion_output = portion_output
    @prise          = prise
  end

  def about_dish
    puts '==========================================='
    puts "The dish #{title}"
    puts "consists of: #{ingredients}"
    puts "Portion of #{portion_output} grams."
    puts "You will pay for this dish #{prise} dollars"
    puts '==========================================='
  end
end

require 'json'

  begin
    file = File.read('dish_bad.json')
    data = JSON.parse(file)
    menu = data['Dish'].map {|rd| Dish.new(rd['title'], rd['ingredients'], rd['portion_output'], rd['prise'])}
    menu.each_index {|i|  menu[i].about_dish}
  rescue DishException
    puts 'Ups! Bad '
  else
    puts 'Data is correct. Fine!'
  ensure
    puts 'Close file'
  end