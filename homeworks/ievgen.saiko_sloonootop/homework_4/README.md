HOMEWORK #4
-----------------------------------

### The Mario's Pyramid is the not a problem;)
```
class MariosPyramid
  def initialize (pyramid_symbol, numbers)
    @pyramid_symbol = pyramid_symbol
    @numbers = numbers
  end
  def pyramid
    pyramid = Array.new(@numbers) {|i| (" "*(@numbers - (i+1)) + @pyramid_symbol*(i+1) + "  " + @pyramid_symbol*(i+1) + " "*(@numbers - (i+1)))}
    puts pyramid
  end
end
  
loop do
  
  print "Type the SYMBOL of the blocks in Mario's Pyramid: "
  pyramid_symbol = gets.chomp.freeze
  
  print "Please, enter the NUMBER of floors in the Mario's pyramid (NOT less than 2): "
  numbers = gets.chomp.to_i
  
  p1 = MariosPyramid.new(pyramid_symbol, numbers)
  
    case
      when numbers < 2
        puts "Incorrect NUMBER. Try again!"
      when pyramid_symbol.length > 1
        puts "Incorrect SYMBOL. Try again!"
      else
        p1.pyramid
    end    
    
    break if (numbers > 1) and (pyramid_symbol.length == 1)
    
end
```