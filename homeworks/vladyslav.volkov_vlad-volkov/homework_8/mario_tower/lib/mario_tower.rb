require 'mario_tower/version'

# module MarioTower
class Tower
  def build_tower
    puts 'Input number (number >=2)'
    number = gets.to_i
    if number < 2
      puts 'Error'
    else
      i = 1
      i.upto(number) do |j|
        puts ' ' * (number - j) + '#' * j + '  ' + '#' * j
      end
    end
  end
end

tower = Tower.new
tower.build_tower
