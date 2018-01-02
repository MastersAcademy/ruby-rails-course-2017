class Dog
  attr_accessor :name, :health, :hunger, :asleep, :play, :defend

  def initialize(name)
    @name = name
    @health = 10
    @hunger = 10
    @asleep = 10
    @play = 10
    @defend = false
    puts @name + ' was born.'
  end

  def help
    puts "Dog can be feeded - dog.feed
          You can play with him - dog.game
          Put to sleep - dog.go_to_sleep
          Get clean - dog.clean
          Can defend - dog.someone_strange"
  end

  def feed
    puts 'Need to feed ' + @name
    @hunger = 10
    @health += 2
    passage_of_time
  end

  def game
    puts 'Lets play with ' + @name
    @play = 10
    @hunger -=2
    passageOfTime
  end

  def go_to_sleep
    puts @name.to_s + ' go to sleep'
    @hunger -= 2
    @health += 3
    @asleep = 10
  end

  def defend_master
    puts @name + ' start woofing'
    @defend = true
    @hunger -= 1
    @asleep -= 1
    if @hunger <= 5 && @asleep <= 5
      @health -= 2
    end
    passage_of_time
  end

  def clean
    puts "We need to clean up " + @name
    @health += 3
    @hunger -= 1
  end

  def life_status
    puts "Name of dog " + @name.to_s
    puts "Health " + @health.to_s
    puts "Hunger " + @hunger.to_s
    puts "Asleep " + @asleep.to_s
    puts "Funnies " + @play.to_s
    puts "Is someone enemy nearby? " + @defend.to_s
  end

  private

  def passage_of_time
    @hunger -= 1
    @asleep -= 3
    @health -= 1
    if @hunger < 2 && @health < 2
      puts @name + " escape from home"
      exit
    end
  end
end
