HOMEWORK #4
-----------------------------------

### First way
```
loop do
puts "Please, enter the NUMBER of floors in the Mario's pyramid (NOT less than 2):"
numbers = gets.chomp

    case
      when numbers.to_i<2
        puts "Incorrect data. Try again!"
      else
        i=1
        while i <= numbers.to_i do
          floor = " "*(numbers.to_i - i) + "#"*i + " "
          puts floor + floor.reverse
          i +=1
        end
    end
  break if numbers.to_i >1
end
```

### Second way
```
loop do
  
puts "Please, enter the NUMBER of floors in the Mario's pyramid (NOT less than 2):"
numbers = gets.chomp

    case
      when numbers.to_i<2
        puts "Incorrect data. Try again!"
      else
        pyramid = Array.new(numbers.to_i) {|i| (" "*(numbers.to_i - (i+1)) + "#"*(i+1) + " ")+(" "*(numbers.to_i - (i+1)) + "#"*(i+1) + " ").reverse}
        puts pyramid
    end

  break if numbers.to_i >1

end
```