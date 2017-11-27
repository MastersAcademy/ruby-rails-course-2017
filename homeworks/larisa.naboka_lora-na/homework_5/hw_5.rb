class Adviser
  def initialize(hash)
    hash.each do |key, value|
      define_singleton_method(key) { puts  "#{value}" }
    end
  end
end

hash = { hello: 'Hello! My name is Lora :)',
         question: 'How is your name?', 
         first: 'Go to the cinema with your friends.', 
         second: 'Give a nice gift to your best friend.',
         third: 'Visit your relatives.',
         fourth: 'Dont go to work. Stay in bed all day. Let yourself be lazy :)',
         fifth: 'Buy a T-shirt in the color of your eyes.',
         sixth: 'Do a genial cleaning.',
         seventh: 'Start reading a new interesting book.',
         eight: 'Visit a dance lesson. It will be fun!',
         ninth: 'Make some origami figures and give to friends.',
         tenth: 'Do not use all day phones, computers, etc.',
         believe: 'I believe in you.',
         surprise: 'Do you want me to surprise you?',
         joke: 'Um ... not today. Time to go! Good luck, sweet!'
          }


adviser = Adviser.new(hash)

puts adviser.hello
puts adviser.question
name = gets.chomp
puts "#{name.capitalize}, do you want me to advise you what to do tomorrow? Choose a number from 1 to 10."

answer = gets.chomp
answer.to_s

  if answer == "1"
    puts adviser.first
  end

  if answer == "2" 
    puts adviser.second
  end

  if answer == "3" 
    puts adviser.third
  end

  if answer == "4" 
    puts adviser.fourth
  end

  if answer == "5" 
    puts adviser.fifth
  end

  if answer == "6" 
    puts adviser.sixth
  end

  if answer == "7" 
    puts adviser.seventh
  end

  if answer == "8" 
    puts adviser.eight
  end

  if answer == "9" 
    puts adviser.ninth
  end

  if answer == "10" 
    puts adviser.tenth
  end

puts adviser.believe
puts adviser.surprise

answer1 = gets.chomp

puts adviser.joke






