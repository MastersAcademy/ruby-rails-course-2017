# Dog
class Dog
  attr_accessor :name, :health, :hunger, :message, :asleep, :play, :defend, :runaway

  def initialize(name)
    @name = name
    @health = 10
    @hunger = 10
    @asleep = 10
    @play = 10
    @defend = false
    @runaway = false
    @message = @name + ' was born.'
  end

  def feed
    @message = 'Need to feed ' + @name
    @hunger = 11
    @health += 2
    @play -= 1
    passage_of_time
  end

  def game
    @message = 'Lets play with ' + @name
    @play = 11
    @hunger -= 2
    passage_of_time
  end

  def go_to_sleep
    @message = @name.to_s + ' go to sleep'
    @hunger -= 2
    @health += 3
    @asleep = 10
    @play -= 2
  end

  def defend_master
    @message = @name + ' start woofing'
    @defend = true
    @hunger -= 1
    @asleep -= 1
    @play -= 3
    @health -= 2 if @hunger <= 5 && @asleep <= 5
    passage_of_time
  end

  def clean
    @message = 'We need to clean up ' + @name
    @health += 3
    @hunger -= 1
    @play += 1
  end

  private

  def passage_of_time
    @hunger -= 1
    @asleep -= 3
    @health -= 1
    @play -= 1
    if @hunger < 2 && @health < 2
      @message = @name + ' escape from home'
      @runaway = true
    end
  end
end
