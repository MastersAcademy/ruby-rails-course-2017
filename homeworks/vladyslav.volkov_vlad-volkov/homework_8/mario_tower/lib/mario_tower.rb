require "mario_tower/version"

#module MarioTower
  # Your code goes here...
  class Tower
    def build_tower
      puts "Input number (number >=2)"
      number = gets.to_i
      if number < 2
        puts "Error"
      else
        i = 1
        i.upto(number) do |i|
          puts ' '*(number-i) + '#'*i + '  ' + '#'*i
        end
      end
    end
  end
#end
