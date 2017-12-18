puts "Do you want make pyramid(yes-1/no-2)?"
answer = gets.chomp

  if answer == "1"
    puts "What height? Write me number."
    number = gets.chomp

      y = number.to_i
      x = 1

      while x <= y
        string = (" "*(y - x) + "∆"*x)
        puts string + "  " + string.reverse
        x += 1
      end
  end

  if answer == "2"
    puts "Bye. You lost good way to have fan!"
  end




